require "openagent/xml_helpers"
require "openagent/errors"
require "openagent/messaging"
require "logger"

module OpenAgent
  class Client
    include XMLHelpers

    attr_reader :agent, :zone

    ZIS_SUCCESS = 0
    ZIS_NO_MESSAGES = 9

    def self.connect(opts={})
      Client.new.tap do |client|
        client.register
        client.provision(opts.slice(:provide, :subscribe, :request, :respond,
          :publish_add, :publish_change, :publish_delete))
      end
    end

    def initialize(opts={})
      @name         = opts.delete[:name]
      @url          = opts.delete[:url]
      @pretty_print = opts.delete[:pretty_print]

      @log          = Logger.new(opts["log"] || STDOUT, 'daily')
      @agent        = OpenAgent::Agent.new((opts['agent'] || {}).merge(:name => @name))
      @zone         = OpenAgent::Zone.new((opts['zone'] || {}).merge(:uri => @url))

      @msg          = OpenAgent::Messaging.new(@agent, @zone)
    end

    def log(name, body)
      @log.info "#{name}\n" + body + "\n"
    end

    def ack(original_source_id, original_msg_id, code = 1, &block)
      opts = {
        :originalsourceid => original_source_id,
        :originalmsgid => original_msg_id,
        :code => code
      }
      request(:ack, opts, &block)
    end

    def register
      request(:register)
      request(:provision)
    end

    def on_receive_message(&block)
      @on_receive_message_callback = block
    end

    def on_each_loop(&block)
      @on_each_loop_callback = block
    end

    def run
      wait_short = 10
      wait_long = 30
      loop do
        begin
          @on_each_loop_callback.call if @on_each_loop_callback

          wait_period = wait_long
          messages_in_queue = true
          while messages_in_queue
            request(:getmessage) do |http_response, doc, status_code|
              wrap_msg = OpenAgent::Message(http_response.body)
              if message = wrap_msg.inner_message

                if @on_receive_message_callback
                  @on_receive_message_callback.call(wrap_msg, http_response)
                end

                if message.response?
                  case status_code
                  when ZIS_SUCCESS then
                    if message.response.morepackets?
                      wait_period = wait_short
                    else
                      wait_period = wait_long
                    end
                  when ZIS_NO_MESSAGES then
                    if not message.morepackets?
                      wait_period = wait_long
                    end
                  end
                end

                # We send an Ack for both an Event and a Response
                if status_code == ZIS_SUCCESS
                  ack(message.sourceid, message.msgid)
                end
              else
                if status_code == ZIS_NO_MESSAGES
                  messages_in_queue = false
                end
              end
            end
          end
          sleep wait_period
        rescue ResponseError => e
          @log.error e
        end
      end
    end

  protected

    def check_for_errors(doc)
      # First check for a SIF_Error tag
      error_state = (doc / "SIF_Message/SIF_Ack/SIF_Error")
      if error_state and not error_state.empty?
        raise SIFError, error_state
      end

      # Next check for a SIF_Code != 0
      begin
        status_text = (doc / "SIF_Message/SIF_Ack/SIF_Status/SIF_Code").text
        status_code = Integer(status_text)
      rescue ArgumentError
        raise ResponseError("SIF_Code is not an integer: #{status_text.inspect})")
      end

      raise SIFCodeError, status_code unless [0, 9].include? status_code
      status_code
    end

    def send_message(message, &block)
      representer =
        SIF::Representation::XML::
        Infra::Common::Message.new(message)
      req = @zone.create_request(representer.to_xml)
      log "Request", req.body
      @zone.send_request(req).tap do |response|
        xml, doc = formatted_xml(response.body)
        log "Response", xml
        status_code = check_for_errors(doc)
        doc.remove_namespaces!
        yield response, doc, status_code if block_given?
      end
    end

  end
end
