require_relative 'spec_helper'

require 'sif/sif'

require 'openagent/messaging'
require 'openagent/agent'
require 'openagent/zone'

describe OpenAgent::Messaging do

  #let(:agent) {
  #  OpenAgent::Agent.new(
  #    :sourceid => "SOURCEID",
  #    :msg_xmlns => "http://www.sifinfo.org/infrastructure/2.x",
  #    :msg_version => "2.0r1")
  #}
  let(:agent) { OpenAgent::Agent.from_yaml(fixture("agent.yaml")) }
  let(:zone) { OpenAgent::Zone.from_yaml(fixture("zone.yaml")) }

  let(:messaging) { OpenAgent::Messaging.new(agent, zone) }

  before do
    messaging.stub(:guuid) { "GUUID" }
    messaging.stub(:timestamp) { "TIME" }
  end

  def header_checks_out(&block)
    block.call.tap do |msg|
      msg.message.header.source_id.should == "Canvas"
      msg.msg_id.should match(/^[A-Z0-9]+$/)
    end
  end

  def represent(msg)
    SIF::Representation::XML::Infra::Common::Message.new(msg)
  end

  it "registers" do
    msg = header_checks_out{ messaging.register }
    represent(msg).to_xml.should ==
      "<SIF_Message xmlns=\"http://www.sifinfo.org/infrastructure/2.x\" Version=\"2.0r1\">\n  <SIF_Register>\n    <SIF_Header>\n      <SIF_MsgId>GUUID</SIF_MsgId>\n      <SIF_Timestamp>TIME</SIF_Timestamp>\n      <SIF_SourceId>SOURCEID</SIF_SourceId>\n    </SIF_Header>\n  </SIF_Register>\n</SIF_Message>"
  end

  it "unregisters" do
    header_checks_out{ messaging.unregister }
  end


  it "requests" do
    header_checks_out{ messaging.request("StudentPersonal", nil) }
  end

  it "pings" do
    msg = header_checks_out{ messaging.ping }
    represent(msg).to_xml.should == "<SIF_Message xmlns=\"http://www.sifinfo.org/infrastructure/2.x\" Version=\"2.0r1\">\n  <SIF_SystemControl>\n    <SIF_Header>\n      <SIF_MsgId>GUUID</SIF_MsgId>\n      <SIF_Timestamp>TIME</SIF_Timestamp>\n      <SIF_SourceId>SOURCEID</SIF_SourceId>\n    </SIF_Header>\n    <SIF_SystemControlData>\n      <SIF_Ping/>\n    </SIF_SystemControlData>\n  </SIF_SystemControl>\n</SIF_Message>"
  end

  it "sleeps" do
    msg = header_checks_out{ messaging.sleep }
    represent(msg).to_xml.should == "<SIF_Message xmlns=\"http://www.sifinfo.org/infrastructure/2.x\" Version=\"2.0r1\">\n  <SIF_SystemControl>\n    <SIF_Header>\n      <SIF_MsgId>GUUID</SIF_MsgId>\n      <SIF_Timestamp>TIME</SIF_Timestamp>\n      <SIF_SourceId>SOURCEID</SIF_SourceId>\n    </SIF_Header>\n    <SIF_SystemControlData>\n      <SIF_Sleep/>\n    </SIF_SystemControlData>\n  </SIF_SystemControl>\n</SIF_Message>"
  end

  it "wakes up" do
    msg = header_checks_out{ messaging.wakeup }
    represent(msg).to_xml.should == "<SIF_Message xmlns=\"http://www.sifinfo.org/infrastructure/2.x\" Version=\"2.0r1\">\n  <SIF_SystemControl>\n    <SIF_Header>\n      <SIF_MsgId>GUUID</SIF_MsgId>\n      <SIF_Timestamp>TIME</SIF_Timestamp>\n      <SIF_SourceId>SOURCEID</SIF_SourceId>\n    </SIF_Header>\n    <SIF_SystemControlData>\n      <SIF_Wakeup/>\n    </SIF_SystemControlData>\n  </SIF_SystemControl>\n</SIF_Message>"
  end

  it "gets messages" do
    msg = header_checks_out{ messaging.get_message }
    represent(msg).to_xml.should == "<SIF_Message xmlns=\"http://www.sifinfo.org/infrastructure/2.x\" Version=\"2.0r1\">\n  <SIF_SystemControl>\n    <SIF_Header>\n      <SIF_MsgId>GUUID</SIF_MsgId>\n      <SIF_Timestamp>TIME</SIF_Timestamp>\n      <SIF_SourceId>SOURCEID</SIF_SourceId>\n    </SIF_Header>\n    <SIF_SystemControlData>\n      <SIF_GetMessage/>\n    </SIF_SystemControlData>\n  </SIF_SystemControl>\n</SIF_Message>"
  end

  it "acks" do
    msg = header_checks_out{ messaging.ack("SRCID", "MSGID", "01") }
    msg.ack.status.code.should == "01"
  end

  it "provisions" do
    msg = messaging.provision
    represent(msg).to_xml.should == "<SIF_Message xmlns=\"http://www.sifinfo.org/infrastructure/2.x\" Version=\"2.0r1\">\n  <SIF_Provision>\n    <SIF_Header>\n      <SIF_MsgId>GUUID</SIF_MsgId>\n      <SIF_Timestamp>TIME</SIF_Timestamp>\n      <SIF_SourceId>Canvas</SIF_SourceId>\n    </SIF_Header>\n    <SIF_ProvideObjects/>\n    <SIF_SubscribeObjects>\n      <SIF_Object ObjectName=\"LEAInfo\"/>\n      <SIF_Object ObjectName=\"SchoolInfo\"/>\n      <SIF_Object ObjectName=\"TermInfo\"/>\n      <SIF_Object ObjectName=\"SchoolCourseInfo\"/>\n      <SIF_Object ObjectName=\"SectionInfo\"/>\n      <SIF_Object ObjectName=\"StudentPersonal\"/>\n      <SIF_Object ObjectName=\"StaffPersonal\"/>\n      <SIF_Object ObjectName=\"StudentSectionInfo\"/>\n    </SIF_SubscribeObjects>\n    <SIF_PublishAddObjects/>\n    <SIF_PublishChangeObjects/>\n    <SIF_PublishDeleteObjects/>\n    <SIF_RequestObjects>\n      <SIF_Object ObjectName=\"LEAInfo\"/>\n      <SIF_Object ObjectName=\"SchoolInfo\"/>\n      <SIF_Object ObjectName=\"TermInfo\"/>\n      <SIF_Object ObjectName=\"SchoolCourseInfo\"/>\n      <SIF_Object ObjectName=\"SectionInfo\"/>\n      <SIF_Object ObjectName=\"StudentPersonal\"/>\n      <SIF_Object ObjectName=\"StaffPersonal\"/>\n      <SIF_Object ObjectName=\"StudentSectionInfo\"/>\n    </SIF_RequestObjects>\n    <SIF_RespondObjects/>\n  </SIF_Provision>\n</SIF_Message>"
  end

  it "converts to xml" do
    msg = header_checks_out{ messaging.ack("SRCID", "MSGID", "01") }
    represent(msg).to_xml.should == "<SIF_Message xmlns=\"http://www.sifinfo.org/infrastructure/2.x\" Version=\"2.0r1\">\n  <SIF_Ack>\n    <SIF_OriginalSourceId>SRCID</SIF_OriginalSourceId>\n    <SIF_OriginalMsgId>MSGID</SIF_OriginalMsgId>\n    <SIF_Header>\n      <SIF_MsgId>GUUID</SIF_MsgId>\n      <SIF_Timestamp>TIME</SIF_Timestamp>\n      <SIF_SourceId>SOURCEID</SIF_SourceId>\n    </SIF_Header>\n    <SIF_Status>\n      <SIF_Code>01</SIF_Code>\n    </SIF_Status>\n  </SIF_Ack>\n</SIF_Message>"
  end
end