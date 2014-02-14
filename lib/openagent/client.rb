require "sif/sif"
require "openagent/agent"
require "openagent/zone"
require "openagent/xml_helpers"
require "openagent/errors"
require "openagent/message_builder"
require "logger"
require "active_support/hash_with_indifferent_access"

module OpenAgent
  class Client
    include XMLHelpers

    attr_reader :name, :url
    attr_reader :agent, :zone, :builder

    ZIS_SUCCESS = 0
    ZIS_NO_MESSAGES = 9

    Message = SIF::Infra::Common::Message
    MessageRepresenter = ::SIF::Representation::Infra::Common::Message

    def self.connect(opts={})
      Client.new(opts).tap do |client|
        client.register
        client.provision
      end
    end

    def initialize(opts={})
      @callbacks    = {
        :receive_message => [],
        :each_loop => []
      }

      opts = ActiveSupport::HashWithIndifferentAccess.new(opts)

      @name         = opts.delete(:name)
      @url          = opts.delete(:url)
      @pretty_print = opts.has_key?(:pretty_print) ? opts.delete(:pretty_print) : true

      @agent_opts = opts[:agent_opts] || {}
      @agent_opts[:name] = @name if @name

      @zone_opts = opts[:zone_opts] || {}
      @zone_opts[:uri] = @url if @url

      @log          = opts[:logger] || Logger.new(opts[:logfile] || STDOUT, 'daily')
      @agent        = opts[:agent] || OpenAgent::Agent.new(@agent_opts)
      @zone         = opts[:zone] || OpenAgent::Zone.new(@zone_opts)

      @builder      = OpenAgent::MessageBuilder.new(@agent, @zone)
    end

    def log(name, body)
      @log.info "#{name}\n#{body}\n"
    end

    # Proxy to OpenAgent::MessageBuilder, e.g. ack, request, event, provision,
    # register, unregister, ping, sleep, wakeup, get_message, get_zone_status,
    # get_agent_acl
    def method_missing(method, *args, &block)
      if @builder.respond_to?(method)
        message = @builder.send(method, *args)
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

    def run_once
      trigger(:each_loop)
      message = nil
      begin
        get_message do |message, outgoing, xml|
          if inner = message.inner_message
            trigger(:receive_message, message, outgoing, xml)

            # We send an Ack for both an Event and a Response
            if message.status_code == ZIS_SUCCESS
              ack(inner.source_id, inner.msg_id)
            end
          end
        end
      end while message && message.status_code == ZIS_SUCCESS
    end

    def run_loop(wait_period=30)
      Proc.new do
        begin
          run_once
          sleep wait_period
        rescue ResponseError => e
          @log.error e
        rescue Net::OpenTimeout => e
          @log.error e
          sleep(5)
        end
      end
    end

    def run(wait_period=30, cycles=nil)
      if cycles
        cycles.times(&run_loop(wait_period))
      else
        loop(&run_loop(wait_period))
      end
    end

  protected

    def check_for_errors(msg)
      # First check for a SIF_Error tag
      raise SIFError, msg.ack.error if msg.ack.error

      # Next check for a SIF_Code != 0
      status_code = msg.ack.status.code
      raise SIFCodeError, status_code unless [0, 9].include? status_code

      status_code
    end

    def send_message(outgoing, &block)
      representer = MessageRepresenter.new(outgoing)
      req = @zone.create_request(representer.to_xml)

      log "Request", req.body
      @zone.send_request(req).tap do |response|
        log "Response", formatted_xml(response.body, @pretty_print)

        if response.body.nil? or response.body.empty?
          raise ResponseError, "Response is empty"
        else
          incoming = Message.new
          MessageRepresenter.new(incoming).from_xml(response.body)

          check_for_errors(incoming)

          yield incoming, outgoing, response.body if block_given?
        end
      end
    end

  end
end
