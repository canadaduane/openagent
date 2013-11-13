require "openagent/xml_helpers"
require "openagent/errors"
require "openagent/message_builder"
require "sif/sif"
require "logger"

module OpenAgent
  class Client
    include XMLHelpers

    attr_reader :agent, :zone, :builder

    ZIS_SUCCESS = 0
    ZIS_NO_MESSAGES = 9

    MessageRepresenter = ::SIF::Representation::XML::Infra::Common::Message

    def self.connect(opts={})
      Client.new.tap do |client|
        client.register
        client.provision(opts.slice(:provide, :subscribe, :request, :respond,
          :publish_add, :publish_change, :publish_delete))
      end
    end

    def initialize(opts={})
      @callbacks    = {
        :receive_message => [],
        :each_loop => []
      }

      @name         = opts.delete[:name]
      @url          = opts.delete[:url]
      @pretty_print = opts.delete[:pretty_print]

      @log          = Logger.new(opts["log"] || STDOUT, 'daily')
      @agent        = opts['agent'] ||
        OpenAgent::Agent.new((opts['agent_opts'] || {}).merge(:name => @name))
      @zone         = opts['zone'] ||
        OpenAgent::Zone.new((opts['zone_opts'] || {}).merge(:uri => @url))

      @builder      = OpenAgent::MessageBuilder.new(@agent, @zone)
    end

    def log(name, body)
      @log.info "#{name}\n" + body + "\n"
    end

    # Proxy to OpenAgent::Messaging
    def method_missing(method, *args, &block)
      if @msg.respond_to?(method)
        message = @msg.send(method, *args)
        send_message(message, &block)
      else
        super
      end
    end

    def callback(name, &block)
      if cbs = @callbacks[name.to_sym]
        cbs << block
      else
        raise "Can't register callback #{name}. " +
              "Available callbacks: #{@callbacks.keys.inspect}"
      end
    end

    def trigger(name, *args)
      if cbs = @callbacks[name.to_sym]
        cbs.each { |cb| cb.call(*args) }
      else
        raise "Can't trigger callback #{name}. " +
              "Available callbacks: #{@callbacks.keys.inspect}"
      end
    end

    def run
      wait_short = 10
      wait_long = 30
      loop do
        begin
          trigger(:each_loop)

          wait_period = wait_long
          messages_in_queue = true
          while messages_in_queue
            get_message do |http_response, doc, status_code|
              wrap_msg = SIF::Infra::Common::Message.new
              MessageRepresenter.new(wrap_msg).from_xml(http_response.body)

              if message = wrap_msg.inner_message

                trigger(:receive_message, wrap_msg, http_response)

                if message.response
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
      representer = MessageRepresenter.new(message)
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
