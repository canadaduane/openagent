require "uuid"
#require "./lib/openagent/messages"
require "./lib/sif/sif"

module OpenAgent
  class Messaging
    attr_writer :timestamp, :guuid

    def initialize(agent_obj, zone_obj)
      @agent_obj = agent_obj
      @zone_obj = zone_obj
    end

    def timestamp
      @timestamp || Time.now.strftime('%Y-%m-%dT%H:%M:%S')
    end

    def guuid
      @guuid || UUID.generate(:compact).upcase
    end

    def header
      SIF::Infra::Common::Header.new(
          :msg_id => guuid(),
          :source_id => @agent_obj.sourceid,
          :timestamp => timestamp()
      )
    end

    def register
      SIF::Infra::Common::Message.new(
        :version => @agent_obj.msg_version,
        :xmlns => @agent_obj.msg_xmlns,
        :register => SIF::Infra::Message::Register.new(
          :name => @agent_obj.name,
          :version => @agent_obj.version,
          :max_buffer_size => @agent_obj.maxbuffersize,
          :mode => @agent_obj.mode,
          :header => header
        )
      )
    end

    def unregister
      SIF::Infra::Common::Message.new(
        :version => @agent_obj.msg_version,
        :xmlns => @agent_obj.msg_xmlns,
        :unregister => SIF::Infra::Message::Unregister.new(
          :header => header
        )
      )
    end

    def request(object_name, condition_group=nil)
      SIF::Infra::Common::Message.new(
        :version => @agent_obj.msg_version,
        :xmlns => @agent_obj.msg_xmlns,
        :request => SIF::Infra::Message::Request.new(
          :version => @agent_obj.version,
          :max_buffer_size => @agent_obj.maxbuffersize,
          :header => header,
          :query => SIF::Infra::Common::Query.new(
            :query_object => SIF::Infra::Common::QueryObject.new(
              :object_name => object_name
            ),
            :condition_group => condition_group
          )
        )
      )
    end

    def system_control(message_instance)
      SIF::Infra::Common::Message.new(
        :version => @agent_obj.msg_version,
        :xmlns => @agent_obj.msg_xmlns,
        :system_control => SIF::Infra::Message::SystemControl.new(
          :header => header,
          :system_control_data => SIF::Infra::Message::SystemControlData.new(
            :data => message_instance
          )
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


    def getzonestatus(agent_obj = nil, zone_obj = nil)
      msg = OpenAgent::Message::SIF_SystemControl::SIF_Message.new
      msg.version = agent_obj.msg_version
      msg.xmlns = agent_obj.msg_xmlns
      msg.systemcontrol = OpenAgent::Message::SIF_SystemControl::SIF_SystemControl.new
      msg.systemcontrol.header = OpenAgent::Message::SIF_Header.new
      msg.systemcontrol.systemcontroldata = OpenAgent::Message::SIF_SystemControl::SIF_SystemControlData.new
      msg.systemcontrol.systemcontroldata.getzonestatus = OpenAgent::Message::SIF_SystemControl::SIF_GetZoneStatus.new
      msg.systemcontrol.header.msgid = guuid()
      msg.systemcontrol.header.sourceid = agent_obj.sourceid
      msg.systemcontrol.header.timestamp = timestamp()
      
      return msg, msg.systemcontrol.header.msgid
    end

    def getagentacl(agent_obj = nil, zone_obj = nil)
      msg = OpenAgent::Message::SIF_SystemControl::SIF_Message.new
      msg.version = agent_obj.msg_version
      msg.xmlns = agent_obj.msg_xmlns
      msg.systemcontrol = OpenAgent::Message::SIF_SystemControl::SIF_SystemControl.new
      msg.systemcontrol.header = OpenAgent::Message::SIF_Header.new
      msg.systemcontrol.systemcontroldata = OpenAgent::Message::SIF_SystemControl::SIF_SystemControlData.new
      msg.systemcontrol.systemcontroldata.getagentacl = OpenAgent::Message::SIF_SystemControl::SIF_GetAgentACL.new
      msg.systemcontrol.header.msgid = guuid()
      msg.systemcontrol.header.sourceid = agent_obj.sourceid
      msg.systemcontrol.header.timestamp = timestamp()
      
      return msg, msg.systemcontrol.header.msgid
    end

    def cancelrequest(agent_obj = nil, zone_obj = nil, notification_type = 'None', requestmsgids = [])
      msg = OpenAgent::Message::SIF_SystemControl::SIF_Message.new
      msg.version = agent_obj.msg_version
      msg.xmlns = agent_obj.msg_xmlns
      msg.systemcontrol = OpenAgent::Message::SIF_SystemControl::SIF_SystemControl.new
      msg.systemcontrol.header = OpenAgent::Message::SIF_Header.new
      msg.systemcontrol.header.msgid = guuid()
      msg.systemcontrol.header.sourceid = agent_obj.sourceid
      msg.systemcontrol.header.timestamp = timestamp()
      msg.systemcontrol.systemcontroldata = OpenAgent::Message::SIF_SystemControl::SIF_SystemControlData.new
      msg.systemcontrol.systemcontroldata.cancelrequest = OpenAgent::Message::SIF_SystemControl::SIF_CancelRequest.new
      msg.systemcontrol.systemcontroldata.cancelrequest.notificationtype = notificationtype
  
      msg.systemcontrol.systemcontroldata.cancelrequest.requestmsgids = []
      if !requestmsgids.nil? then
      SIF_RequestMsgIds.each { |e| 
        rmi = OpenAgent::Message::SIF_SystemControl::SIF_RequestMsgId.new
        rmi.requestmsgid = e 
        msg.systemcontrol.systemcontroldata.cancelrequest.requestmsgids << rmi
        }
      end
      
      return msg, msg.systemcontrol.header.msgid
    end

    def object(objname)
      @o = OpenAgent::Message::SIF_Provision::SIF_Object.new
      @o.objectname = objname
      return @o
    end

    def provision
      so = []
      @agent_obj.subscribeobjects.each { |e| so << e } if !@agent_obj.subscribeobjects.nil?
      rqo = []
      @agent_obj.requestobjects.each { |e| rqo << e } if !@agent_obj.requestobjects.nil?
      po = []
      @agent_obj.provideobjects.each { |e| po << e } if !@agent_obj.provideobjects.nil?
      rpo = []
      @agent_obj.respondobjects.each { |e| rpo << e } if !@agent_obj.respondobjects.nil?
      pao = []
      @agent_obj.publishaddobjects.each { |e| pao << e } if !@agent_obj.publishaddobjects.nil?
      pdo = []
      @agent_obj.publishdeleteobjects.each { |e| pdo << e } if !@agent_obj.publishdeleteobjects.nil?
      pco = []
      @agent_obj.publishchangeobjects.each { |e| pco << e } if !@agent_obj.publishchangeobjects.nil?
      SIF::Infra::Common::Message.new(
          :version => @agent_obj.msg_version,
          :xmlns => @agent_obj.msg_xmlns,
          :provision => SIF::Infra::Common::Provision.new(
            :header => header,
            :subscribe_objects => so.map { |o| SIF::Infra::Common::Object.new(:object_name => o)},
            :provide_objects =>po.map { |o| SIF::Infra::Common::Object.new(:object_name => o)},
            :request_objects => rqo.map { |o| SIF::Infra::Common::Object.new(:object_name => o)},
            :respond_objects => rpo.map { |o| SIF::Infra::Common::Object.new(:object_name => o)},
            :publish_add_objects => pao.map { |o| SIF::Infra::Common::Object.new(:object_name => o)},
            :publish_change_objects => pco.map { |o| SIF::Infra::Common::Object.new(:object_name => o)},
            :publish_delete_objects => pdo.map { |o| SIF::Infra::Common::Object.new(:object_name => o)},
          )
        )
    end
    def event(object_name, action='Change',object=nil)
      SIF::Infra::Common::Message.new(
          :version => @agent_obj.msg_version,
          :xmlns => @agent_obj.msg_xmlns,
          :event => SIF::Infra::Common::Event.new(
              :header => header,
              :object_data => SIF::Infra::Common::ObjectData.new(
                  :event_object => SIF::Infra::Common::EventObject.new(
                      :object_name => object_name,
                      :action => action,
                      :objects => object(object_name)
                  )
              )
          )
      )
    end

    def ack(original_source_id=nil, original_msg_id=nil, code=nil)
      SIF::Infra::Common::Message.new(
        :version => @agent_obj.msg_version,
        :xmlns => @agent_obj.msg_xmlns,
        :ack => SIF::Infra::Message::Ack.new(
          :header => header,
          :original_source_id => original_source_id,
          :original_msg_id => original_msg_id,
          :status => SIF::Infra::Common::Status.new(
            :code => code
          )
        )
      )
    end
  end
end