require_relative 'spec_helper'

require 'sif/sif'

require 'openagent/messaging'
require 'openagent/agent'
require 'openagent/zone'

describe OpenAgent::Messaging do
  let(:agent) { OpenAgent::Agent.new(:sourceid => "SOURCEID") }
  let(:zone) { OpenAgent::Zone.from_yaml(fixture("zone.yaml")) }

  let(:messaging) { OpenAgent::Messaging.new(agent, zone) }

  def header_checks_out(&block)
    block.call.tap do |msg|
      msg.message.header.source_id.should == "SOURCEID"
      msg.msg_id.should match(/^[A-Z0-9]+$/)
    end
  end

  it "registers" do
    header_checks_out{ messaging.register }
    msg = messaging.register
    msg.register.header.msg_id = "STATIC"
    msg.version = "2.0r1"
    msg.xmlns = "http://www.sifinfo.org/infrastructure/2.x"
    msg.register.header.timestamp = "TIME"
    xml = SIF::Representation::XML::Infra::Common::Message.new(msg)
    xml.to_xml.should == "<SIF_Message xmlns=\"http://www.sifinfo.org/infrastructure/2.x\" Version=\"2.0r1\">\n  <SIF_Register>\n    <SIF_Header>\n      <SIF_MsgId>STATIC</SIF_MsgId>\n      <SIF_Timestamp>TIME</SIF_Timestamp>\n      <SIF_SourceId>SOURCEID</SIF_SourceId>\n    </SIF_Header>\n  </SIF_Register>\n</SIF_Message>"
  end

  it "unregisters" do
    header_checks_out{ messaging.unregister }
  end

  it "requests" do
    header_checks_out{ messaging.request("StudentPersonal", nil) }
  end

  it "pings" do
    header_checks_out{ messaging.ping }
    msg = messaging.ping
    msg.system_control.header.msg_id = "STATIC"
    msg.version = "2.0r1"
    msg.xmlns = "http://www.sifinfo.org/infrastructure/2.x"
    msg.system_control.header.timestamp = "TIME"
    msg.system_control.system_control_data.ping = SIF::Infra::Message::Ping.new
    xml = SIF::Representation::XML::Infra::Common::Message.new(msg)
    xml.to_xml.should == "<SIF_Message xmlns=\"http://www.sifinfo.org/infrastructure/2.x\" Version=\"2.0r1\">\n  <SIF_SystemControl>\n    <SIF_Header>\n      <SIF_MsgId>STATIC</SIF_MsgId>\n      <SIF_Timestamp>TIME</SIF_Timestamp>\n      <SIF_SourceId>SOURCEID</SIF_SourceId>\n    </SIF_Header>\n    <SIF_SystemControlData>\n      <SIF_Ping/>\n    </SIF_SystemControlData>\n  </SIF_SystemControl>\n</SIF_Message>"
  end

  it "sleeps" do
    header_checks_out{ messaging.sleep }
    msg = messaging.sleep
    msg.system_control.header.msg_id = "STATIC"
    msg.version = "2.0r1"
    msg.xmlns = "http://www.sifinfo.org/infrastructure/2.x"
    msg.system_control.header.timestamp = "TIME"
    msg.system_control.system_control_data.sleep = SIF::Infra::Message::Sleep.new
    xml = SIF::Representation::XML::Infra::Common::Message.new(msg)
    xml.to_xml.should == "<SIF_Message xmlns=\"http://www.sifinfo.org/infrastructure/2.x\" Version=\"2.0r1\">\n  <SIF_SystemControl>\n    <SIF_Header>\n      <SIF_MsgId>STATIC</SIF_MsgId>\n      <SIF_Timestamp>TIME</SIF_Timestamp>\n      <SIF_SourceId>SOURCEID</SIF_SourceId>\n    </SIF_Header>\n    <SIF_SystemControlData>\n      <SIF_Sleep/>\n    </SIF_SystemControlData>\n  </SIF_SystemControl>\n</SIF_Message>"
  end

  it "wakes up" do
    header_checks_out{ messaging.wakeup }
    msg = messaging.wakeup
    msg.system_control.header.msg_id = "STATIC"
    msg.version = "2.0r1"
    msg.xmlns = "http://www.sifinfo.org/infrastructure/2.x"
    msg.system_control.header.timestamp = "TIME"
    msg.system_control.system_control_data.wake = SIF::Infra::Message::Wakeup.new
    xml = SIF::Representation::XML::Infra::Common::Message.new(msg)
    xml.to_xml.should == "<SIF_Message xmlns=\"http://www.sifinfo.org/infrastructure/2.x\" Version=\"2.0r1\">\n  <SIF_SystemControl>\n    <SIF_Header>\n      <SIF_MsgId>STATIC</SIF_MsgId>\n      <SIF_Timestamp>TIME</SIF_Timestamp>\n      <SIF_SourceId>SOURCEID</SIF_SourceId>\n    </SIF_Header>\n    <SIF_SystemControlData>\n      <SIF_Wakeup/>\n    </SIF_SystemControlData>\n  </SIF_SystemControl>\n</SIF_Message>"
  end
  it "gets messages" do
    header_checks_out{ messaging.get_message }
    msg = messaging.get_message
    msg.system_control.header.msg_id = "B0E80A74265A4A75ADDC0ECC50AEF737"
    msg.version = "2.0r1"
    msg.xmlns = "http://www.sifinfo.org/infrastructure/2.x"
    msg.system_control.header.timestamp = "2006-10-14T15:54:32-08:00"
    msg.system_control.system_control_data.get_message = SIF::Infra::Message::GetMessage.new
    xml = SIF::Representation::XML::Infra::Common::Message.new(msg)
    xml.to_xml.should == "<SIF_Message xmlns=\"http://www.sifinfo.org/infrastructure/2.x\" Version=\"2.0r1\">\n  <SIF_SystemControl>\n    <SIF_Header>\n      <SIF_MsgId>B0E80A74265A4A75ADDC0ECC50AEF737</SIF_MsgId>\n      <SIF_Timestamp>2006-10-14T15:54:32-08:00</SIF_Timestamp>\n      <SIF_SourceId>SOURCEID</SIF_SourceId>\n    </SIF_Header>\n    <SIF_SystemControlData>\n      <SIF_GetMessage/>\n    </SIF_SystemControlData>\n  </SIF_SystemControl>\n</SIF_Message>"
  end

  it "acks" do
    msg = header_checks_out{ messaging.ack("SRCID", "MSGID", "01") }
    msg.ack.status.code.should == "01"
  end

  it "converts to xml" do
    msg = messaging.ack("SRCID", "MSGID", "01")
    msg.ack.header.msg_id = "STATIC"
    msg.ack.header.timestamp = "STATIC"
    xml = SIF::Representation::XML::Infra::Common::Message.new(msg)
    xml.to_xml.should == "<SIF_Message>\n  <SIF_Ack>\n    <SIF_OriginalSourceId>SRCID</SIF_OriginalSourceId>\n    <SIF_OriginalMsgId>MSGID</SIF_OriginalMsgId>\n    <SIF_Header>\n      <SIF_MsgId>STATIC</SIF_MsgId>\n      <SIF_Timestamp>STATIC</SIF_Timestamp>\n      <SIF_SourceId>SOURCEID</SIF_SourceId>\n    </SIF_Header>\n    <SIF_Status>\n      <SIF_Code>01</SIF_Code>\n    </SIF_Status>\n  </SIF_Ack>\n</SIF_Message>"
  end
end