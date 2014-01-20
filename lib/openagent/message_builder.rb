require "uuid"
require "sif/sif"

module OpenAgent
  class MessageBuilder
    attr_writer :timestamp, :guuid

    def initialize(agent, zone)
      @agent = agent
      @zone = zone
    end

    def ack(original_source_id, original_msg_id, code=1)
      SIF::Infra::Common::Message.new(
        :version => @agent.msg_version,
        :xmlns => @agent.msg_xmlns,
        :ack => SIF::Infra::Message::Ack.new(
          :header => create_header,
          :original_source_id => original_source_id,
          :original_msg_id => original_msg_id,
          :status => SIF::Infra::Common::Status.new(
            :code => code
          )
        )
      )
    end

    def request(object_name, condition_group=nil)
      SIF::Infra::Common::Message.new(
        :version => @agent.msg_version,
        :xmlns => @agent.msg_xmlns,
        :request => SIF::Infra::Message::Request.new(
          :version => @agent.version,
          :max_buffer_size => @agent.max_buffer_size,
          :header => create_header,
          :query => SIF::Infra::Common::Query.new(
            :query_object => SIF::Infra::Common::QueryObject.new(
              :object_name => object_name
            ),
            :condition_group => condition_group
          )
        )
      )
    end

    def event(object_name, action='Change', object_model=nil)
      SIF::Infra::Common::Message.new(
        :version => @agent.msg_version,
        :xmlns => @agent.msg_xmlns,
        :event => SIF::Infra::Message::Event.new(
          :header => create_header,
          :object_data => SIF::Infra::Common::ObjectData.new(
            :event_object => SIF::Infra::Common::EventObject.new(
              :object_name => object_name,
              :action => action,
              :object => object_model
            )
          )
        )
      )
    end

    def provision
      object = SIF::Infra::Common::Object
      SIF::Infra::Common::Message.new(
        :version => @agent.msg_version,
        :xmlns => @agent.msg_xmlns,
        :provision => SIF::Infra::Common::Provision.new(
          :header => create_header,
          :subscribe_objects =>
            (@agent.subscribe || []).map { |o| object.new(:object_name => o) },
          :provide_objects =>
            (@agent.provide || []).map { |o| object.new(:object_name => o) },
          :request_objects =>
            (@agent.request || []).map { |o| object.new(:object_name => o) },
          :respond_objects => 
            (@agent.respond || []).map { |o| object.new(:object_name => o) },
          :publish_add_objects => 
            (@agent.publish_add || []).map { |o| object.new(:object_name => o) },
          :publish_change_objects => 
            (@agent.publish_change || []).map { |o| object.new(:object_name => o) },
          :publish_delete_objects => 
            (@agent.publish_delete || []).map { |o| object.new(:object_name => o) },
        )
      )
    end

    def register
      SIF::Infra::Common::Message.new(
        :version => @agent.msg_version,
        :xmlns => @agent.msg_xmlns,
        :register => SIF::Infra::Message::Register.new(
          :name => @agent.name,
          :version => @agent.version,
          :max_buffer_size => @agent.max_buffer_size,
          :mode => @agent.mode,
          :header => create_header
        )
      )
    end

    def unregister
      SIF::Infra::Common::Message.new(
        :version => @agent.msg_version,
        :xmlns => @agent.msg_xmlns,
        :unregister => SIF::Infra::Message::Unregister.new(
          :header => create_header
        )
      )
    end

    def ping
      system_control(SIF::Infra::Message::Ping.new)
    end

    def sleep
      system_control(SIF::Infra::Message::Sleep.new)
    end

    def wakeup
      system_control(SIF::Infra::Message::Wakeup.new)
    end

    def get_message
      system_control(SIF::Infra::Message::GetMessage.new)
    end

    def get_zone_status
      system_control(SIF::Infra::Message::GetZoneStatus.new)
    end

    def get_agent_acl
      system_control(SIF::Infra::Message::GetAgentACL.new)
    end

  protected

    def timestamp
      @timestamp || Time.now.strftime('%Y-%m-%dT%H:%M:%S')
    end

    def guuid
      @guuid || UUID.generate(:compact).upcase
    end

    def create_header
      SIF::Infra::Common::Header.new(
        :msg_id => guuid(),
        :source_id => @agent.source_id,
        :timestamp => timestamp()
      )
    end

    def system_control(message_instance)
      SIF::Infra::Common::Message.new(
        :version => @agent.msg_version,
        :xmlns => @agent.msg_xmlns,
        :system_control => SIF::Infra::Message::SystemControl.new(
          :header => create_header,
          :system_control_data => SIF::Infra::Message::SystemControlData.new(
            :data => message_instance
          )
        )
      )
    end
  end
end