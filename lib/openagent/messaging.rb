require "uuid"
require "openagent/messages"
require "sif/sif"

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

    def register
      SIF::Infra::Common::Message.new(
        :version => @agent_obj.msg_version,
        :xmlns => @agent_obj.msg_xmlns,
        :register => SIF::Infra::Message::Register.new(
          :name => @agent_obj.name,
          :version => @agent_obj.version,
          :max_buffer_size => @agent_obj.maxbuffersize,
          :mode => @agent_obj.mode,
          :header => SIF::Infra::Common::Header.new(
            :msg_id => guuid(),
            :source_id => @agent_obj.sourceid,
            :timestamp => timestamp()
          )
        )
      )
    end

    def unregister
      SIF::Infra::Common::Message.new(
        :version => @agent_obj.msg_version,
        :xmlns => @agent_obj.msg_xmlns,
        :unregister => SIF::Infra::Message::Unregister.new(
          :header => SIF::Infra::Common::Header.new(
            :msg_id => guuid(),
            :source_id => @agent_obj.sourceid,
            :timestamp => timestamp()
          )
        )
      )
    end

    def request(object_name, condition_group)
      SIF::Infra::Common::Message.new(
        :version => @agent_obj.msg_version,
        :xmlns => @agent_obj.msg_xmlns,
        :request => SIF::Infra::Message::Request.new(
          :version => @agent_obj.version,
          :max_buffer_size => @agent_obj.maxbuffersize,
          :header => SIF::Infra::Common::Header.new(
            :msg_id => guuid(),
            :source_id => @agent_obj.sourceid,
            :timestamp => timestamp()
          ),
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
          :header => SIF::Infra::Common::Header.new(
            :msg_id => guuid(),
            :source_id => @agent_obj.sourceid,
            :timestamp => timestamp()
          ),
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

    def provision(agent_obj = nil, zone_obj = nil)
      so  = OpenAgent::Message::SIF_Provision::SIF_SubscribeObjects.new
      if !agent_obj.subscribeobjects.nil? then
      so.objects = []
      agent_obj.subscribeobjects.each { |e| so.objects << object(e) }
      end
  
      ros = OpenAgent::Message::SIF_Provision::SIF_RequestObjects.new
      if !agent_obj.requestobjects.nil? then
        ros.objects = []
        agent_obj.requestobjects.each { |e| ros.objects << object(e)}
      end
  
      po  = OpenAgent::Message::SIF_Provision::SIF_ProvideObjects.new
      if !agent_obj.provideobjects.nil? then
        po.objects = []
        agent_obj.provideobjects.each { |e| po.objects << object(e)}
      end
  
      pao = OpenAgent::Message::SIF_Provision::SIF_PublishAddObjects.new
      if !agent_obj.publishaddobjects.nil? then
        pao.objects = []
        agent_obj.publishaddobjects.each { |e| pao.objects << object(e)}
      end
  
      pco = OpenAgent::Message::SIF_Provision::SIF_PublishChangeObjects.new
      if !agent_obj.publishchangeobjects.nil? then
      pco.objects = []
      agent_obj.publishchangeobjects.each { |e| pco.objects << object(e)}
      end
  
      pdo = OpenAgent::Message::SIF_Provision::SIF_PublishDeleteObjects.new
      if !agent_obj.publishdeleteobjects.nil? then
        pdo.objects = []
        agent_obj.publishdeleteobjects.each { |e| pdo.objects << object(e)}
      end
  
      ro  = OpenAgent::Message::SIF_Provision::SIF_RespondObjects.new
      if !agent_obj.respondobjects.nil? then
        ro.objects = []
        agent_obj.respondobjects.each { |e| ro.objects << object(e)}
      end
  
      msg = OpenAgent::Message::SIF_Provision::SIF_Message.new
      msg.version = agent_obj.msg_version
      msg.xmlns = agent_obj.msg_xmlns
      msg.provision = OpenAgent::Message::SIF_Provision::SIF_Provision.new
      msg.provision.header = OpenAgent::Message::SIF_Header.new
      msg.provision.header.msgid = guuid
      msg.provision.header.sourceid = agent_obj.sourceid
      msg.provision.header.timestamp = timestamp()
      msg.provision.provideobjects = po
      msg.provision.subscribeobjects = so
      msg.provision.publishaddobjects = pao
      msg.provision.publishchangeobjects = pco
      msg.provision.publishdeleteobjects = pdo
      msg.provision.requestobjects = ros
      msg.provision.respondobjects = ro

      return msg, msg.provision.header.msgid
    end

    def event(agent_obj, zone_obj, objectname, xml, action='Change')
      msg = OpenAgent::Message::SIF_Event::SIF_Message.new
      msg.version = agent_obj.msg_version
      msg.xmlns = agent_obj.msg_xmlns
      msg.event = OpenAgent::Message::SIF_Event::SIF_Event.new
      msg.event.header = OpenAgent::Message::SIF_Header.new
      msg.event.header.msgid = guuid
      msg.event.header.sourceid = agent_obj.sourceid
      msg.event.header.timestamp = timestamp()
      msg.event.objectdata = OpenAgent::Message::SIF_Event::SIF_ObjectData.new
      msg.event.objectdata.eventobject = OpenAgent::Message::SIF_Event::SIF_EventObject.new
      msg.event.objectdata.eventobject.objectname = objectname
      msg.event.objectdata.eventobject.action = action
      msg.event.objectdata.eventobject.text = 'HOLDER'
      doc = msg.to_xml.to_s
      doc = doc.gsub(/HOLDER/, xml)
     
      return doc, msg.event.header.msgid
    end

    def ack(original_source_id=nil, original_msg_id=nil, code=nil)
      SIF::Infra::Common::Message.new(
        :version => @agent_obj.msg_version,
        :xmlns => @agent_obj.msg_xmlns,
        :ack => SIF::Infra::Message::Ack.new(
          :header => SIF::Infra::Common::Header.new(
            :msg_id => guuid(),
            :source_id => @agent_obj.sourceid,
            :timestamp => timestamp()
          ),
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