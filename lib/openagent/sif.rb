require "uuid"
require "openagent/messages"

module OpenAgent
  class SIF
    attr_writer :timestamp, :guuid

    def timestamp
      @timestamp || Time.now.strftime('%Y-%m-%dT%H:%M:%S')
    end

    def guuid
      @guuid || UUID.generate(:compact).upcase
    end

    def register(agent_obj = nil, zone_obj = nil)
      msg = OpenAgent::Message::SIF_Register::SIF_Message.new
      msg.version = agent_obj.msg_version
      msg.xmlns = agent_obj.msg_xmlns
      msg.register = OpenAgent::Message::SIF_Register::SIF_Register.new
      msg.register.name = agent_obj.name
      msg.register.version = agent_obj.version 
      msg.register.maxbuffersize = agent_obj.maxbuffersize
      msg.register.mode = agent_obj.mode
      msg.register.header = OpenAgent::Message::SIF_Header.new
      msg.register.header.msgid = guuid()
      msg.register.header.sourceid = agent_obj.sourceid
      msg.register.header.timestamp = timestamp()
  
      return msg, msg.register.header.msgid
    end

    def unregister(agent_obj = nil, zone_obj = nil)
      msg = OpenAgent::Message::SIF_Unregister::SIF_Message.new
      msg.version = agent_obj.msg_version
      msg.xmlns = agent_obj.msg_xmlns
      msg.unregister = OpenAgent::Message::SIF_Unregister::SIF_Unregister.new
      msg.unregister.header = OpenAgent::Message::SIF_Header.new
      msg.unregister.header.msgid = guuid()
      msg.unregister.header.sourceid = agent_obj.sourceid
      msg.unregister.header.timestamp = timestamp()
  
      return msg, msg.unregister.header.msgid
    end

    def request(agent_obj, zone_obj, objectname, conditiongroup)
      msg = OpenAgent::Message::SIF_Request::SIF_Message.new
      msg.version = agent_obj.msg_version
      msg.xmlns = agent_obj.msg_xmlns
      msg.request = OpenAgent::Message::SIF_Request::SIF_Request.new
      msg.request.header = OpenAgent::Message::SIF_Header.new
      msg.request.header.msgid = guuid()
      msg.request.header.sourceid = agent_obj.sourceid
      msg.request.header.timestamp = timestamp()
      msg.request.version = agent_obj.version
      msg.request.maxbuffersize = agent_obj.maxbuffersize
      msg.request.query = OpenAgent::Message::SIF_Request::SIF_Query.new
      msg.request.query.queryobject = OpenAgent::Message::SIF_Request::SIF_QueryObject.new
      msg.request.query.queryobject.objectname = objectname
  
      msg.request.query.conditiongroup = conditiongroup
   
      return msg, msg.request.header.msgid
    end

    def ping(agent_obj = nil, zone_obj = nil)
      msg = OpenAgent::Message::SIF_SystemControl::SIF_Message.new
      msg.version = agent_obj.msg_version
      msg.xmlns = agent_obj.msg_xmlns
      msg.systemcontrol = OpenAgent::Message::SIF_SystemControl::SIF_SystemControl.new
      msg.systemcontrol.header = OpenAgent::Message::SIF_Header.new
      msg.systemcontrol.systemcontroldata = OpenAgent::Message::SIF_SystemControl::SIF_SystemControlData.new
      msg.systemcontrol.systemcontroldata.ping = OpenAgent::Message::SIF_SystemControl::SIF_Ping.new
      msg.systemcontrol.header.msgid = guuid()
      msg.systemcontrol.header.sourceid = agent_obj.sourceid
      msg.systemcontrol.header.timestamp = timestamp()
      
      return msg, msg.systemcontrol.header.msgid
    end

    def sleep(agent_obj = nil, zone_obj = nil)
      msg = OpenAgent::Message::SIF_SystemControl::SIF_Message.new
      msg.version = agent_obj.msg_version
      msg.xmlns = agent_obj.msg_xmlns
      msg.systemcontrol = OpenAgent::Message::SIF_SystemControl::SIF_SystemControl.new
      msg.systemcontrol.header = OpenAgent::Message::SIF_Header.new
      msg.systemcontrol.systemcontroldata = OpenAgent::Message::SIF_SystemControl::SIF_SystemControlData.new
      msg.systemcontrol.systemcontroldata.sleep = OpenAgent::Message::SIF_SystemControl::SIF_Sleep.new
      msg.systemcontrol.header.msgid = guuid()
      msg.systemcontrol.header.sourceid = agent_obj.sourceid
      msg.systemcontrol.header.timestamp = timestamp()
      
      return msg, msg.systemcontrol.header.msgid
    end

    def wakeup(agent_obj = nil, zone_obj = nil)
      msg = OpenAgent::Message::SIF_SystemControl::SIF_Message.new
      msg.version = agent_obj.msg_version
      msg.xmlns = agent_obj.msg_xmlns
      msg.systemcontrol = OpenAgent::Message::SIF_SystemControl::SIF_SystemControl.new
      msg.systemcontrol.header = OpenAgent::Message::SIF_Header.new
      msg.systemcontrol.systemcontroldata = OpenAgent::Message::SIF_SystemControl::SIF_SystemControlData.new
      msg.systemcontrol.systemcontroldata.wakeup = OpenAgent::Message::SIF_SystemControl::SIF_Wakeup.new
      msg.systemcontrol.header.msgid = guuid()
      msg.systemcontrol.header.sourceid = agent_obj.sourceid
      msg.systemcontrol.header.timestamp = timestamp()
      
      return msg, msg.systemcontrol.header.msgid
    end

    def getmessage(agent_obj = nil, zone_obj = nil)
      msg = OpenAgent::Message::SIF_SystemControl::SIF_Message.new
      msg.version = agent_obj.msg_version
      msg.xmlns = agent_obj.msg_xmlns
      msg.systemcontrol = OpenAgent::Message::SIF_SystemControl::SIF_SystemControl.new
      msg.systemcontrol.header = OpenAgent::Message::SIF_Header.new
      msg.systemcontrol.systemcontroldata = OpenAgent::Message::SIF_SystemControl::SIF_SystemControlData.new
      msg.systemcontrol.systemcontroldata.getmessage = OpenAgent::Message::SIF_SystemControl::SIF_GetMessage.new
      msg.systemcontrol.header.msgid = guuid()
      msg.systemcontrol.header.sourceid = agent_obj.sourceid
      msg.systemcontrol.header.timestamp = timestamp()
      
      return msg, msg.systemcontrol.header.msgid
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

    def ack(agent_obj, zone_obj, originalsourceid=nil, originalmsgid=nil, code=nil)
      msg = OpenAgent::Message::SIF_Ack::SIF_Message.new
      msg.version = agent_obj.msg_version
      msg.xmlns = agent_obj.msg_xmlns
      msg.ack = OpenAgent::Message::SIF_Ack::SIF_Ack.new
      msg.ack.header = OpenAgent::Message::SIF_Header.new
      msg.ack.header.msgid = guuid()
      msg.ack.header.sourceid = agent_obj.sourceid
      msg.ack.header.timestamp = timestamp()
      msg.ack.originalsourceid = originalsourceid
      msg.ack.originalmsgid = originalmsgid
      msg.ack.status = OpenAgent::Message::SIF_Ack::SIF_Status.new
      msg.ack.status.code = code
   
      return msg, msg.ack.header.msgid
    end
  end
end