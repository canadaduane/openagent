require_relative 'spec_helper'
require "openagent/message_builder"
require "openagent/agent"
require "openagent/zone"

describe OpenAgent::MessageBuilder do

  let(:agent) { OpenAgent::Agent.new(YAML::load(File.read(fixture("agent.yaml")))) }
  let(:zone) { OpenAgent::Zone.new(YAML::load(File.read(fixture("zone.yaml")))) }

  let(:builder) { OpenAgent::MessageBuilder.new(agent, zone) }

  before do
    builder.stub(:guuid) { "GUUID" }
    builder.stub(:timestamp) { "TIME" }
    builder.stub(:sourceid) {"SOURCEID"}
  end

  def header_checks_out(&block)
    block.call.tap do |msg|
      msg.content.header.source_id.should == "canvas"
      msg.msg_id.should match(/^[A-Z0-9]+$/)
    end
  end

  def represent(msg)
    SIF::Representation::XML::Infra::Common::Message.new(msg)
  end

  it "registers" do
    msg = header_checks_out{ builder.register }
    represent(msg).to_xml.should ==
      "<SIF_Message xmlns=\"http://www.sifinfo.org/infrastructure/2.x\" Version=\"2.0r1\">\n  <SIF_Register>\n    <SIF_Header>\n      <SIF_MsgId>GUUID</SIF_MsgId>\n      <SIF_Timestamp>TIME</SIF_Timestamp>\n      <SIF_SourceId>canvas</SIF_SourceId>\n    </SIF_Header>\n    <SIF_Name>Canvas by Instructure</SIF_Name>\n    <SIF_Version>2.0r1</SIF_Version>\n    <SIF_MaxBufferSize>64000</SIF_MaxBufferSize>\n    <SIF_Mode>Pull</SIF_Mode>\n  </SIF_Register>\n</SIF_Message>"
  end

  it "unregisters" do
    header_checks_out{ builder.unregister }
  end


  it "requests" do
    header_checks_out{ builder.request("StudentPersonal", nil) }
  end

  it "pings" do
    msg = header_checks_out{ builder.ping }
    represent(msg).to_xml.should == "<SIF_Message xmlns=\"http://www.sifinfo.org/infrastructure/2.x\" Version=\"2.0r1\">\n  <SIF_SystemControl>\n    <SIF_Header>\n      <SIF_MsgId>GUUID</SIF_MsgId>\n      <SIF_Timestamp>TIME</SIF_Timestamp>\n      <SIF_SourceId>canvas</SIF_SourceId>\n    </SIF_Header>\n    <SIF_SystemControlData>\n      <SIF_Ping/>\n    </SIF_SystemControlData>\n  </SIF_SystemControl>\n</SIF_Message>"
  end

  it "sleeps" do
    msg = header_checks_out{ builder.sleep }
    represent(msg).to_xml.should == "<SIF_Message xmlns=\"http://www.sifinfo.org/infrastructure/2.x\" Version=\"2.0r1\">\n  <SIF_SystemControl>\n    <SIF_Header>\n      <SIF_MsgId>GUUID</SIF_MsgId>\n      <SIF_Timestamp>TIME</SIF_Timestamp>\n      <SIF_SourceId>canvas</SIF_SourceId>\n    </SIF_Header>\n    <SIF_SystemControlData>\n      <SIF_Sleep/>\n    </SIF_SystemControlData>\n  </SIF_SystemControl>\n</SIF_Message>"
  end

  it "wakes up" do
    msg = header_checks_out{ builder.wakeup }

    represent(msg).to_xml.should == "<SIF_Message xmlns=\"http://www.sifinfo.org/infrastructure/2.x\" Version=\"2.0r1\">\n  <SIF_SystemControl>\n    <SIF_Header>\n      <SIF_MsgId>GUUID</SIF_MsgId>\n      <SIF_Timestamp>TIME</SIF_Timestamp>\n      <SIF_SourceId>canvas</SIF_SourceId>\n    </SIF_Header>\n    <SIF_SystemControlData>\n      <SIF_Wakeup/>\n    </SIF_SystemControlData>\n  </SIF_SystemControl>\n</SIF_Message>"
  end

  it "gets messages" do
    msg = header_checks_out{ builder.get_message }
    represent(msg).to_xml.should == "<SIF_Message xmlns=\"http://www.sifinfo.org/infrastructure/2.x\" Version=\"2.0r1\">\n  <SIF_SystemControl>\n    <SIF_Header>\n      <SIF_MsgId>GUUID</SIF_MsgId>\n      <SIF_Timestamp>TIME</SIF_Timestamp>\n      <SIF_SourceId>canvas</SIF_SourceId>\n    </SIF_Header>\n    <SIF_SystemControlData>\n      <SIF_GetMessage/>\n    </SIF_SystemControlData>\n  </SIF_SystemControl>\n</SIF_Message>"
  end

  it "acks" do
    msg = header_checks_out{ builder.ack("SRCID", "MSGID", "1") }
    msg.ack.status.code.should == 1
    represent(msg).to_xml.should == "<SIF_Message xmlns=\"http://www.sifinfo.org/infrastructure/2.x\" Version=\"2.0r1\">\n  <SIF_Ack>\n    <SIF_OriginalSourceId>SRCID</SIF_OriginalSourceId>\n    <SIF_OriginalMsgId>MSGID</SIF_OriginalMsgId>\n    <SIF_Header>\n      <SIF_MsgId>GUUID</SIF_MsgId>\n      <SIF_Timestamp>TIME</SIF_Timestamp>\n      <SIF_SourceId>canvas</SIF_SourceId>\n    </SIF_Header>\n    <SIF_Status>\n      <SIF_Code>1</SIF_Code>\n    </SIF_Status>\n  </SIF_Ack>\n</SIF_Message>"
  end

  it "provisions" do
    msg = header_checks_out{builder.provision}
    represent(msg).to_xml.should == "<SIF_Message xmlns=\"http://www.sifinfo.org/infrastructure/2.x\" Version=\"2.0r1\">\n  <SIF_Provision>\n    <SIF_Header>\n      <SIF_MsgId>GUUID</SIF_MsgId>\n      <SIF_Timestamp>TIME</SIF_Timestamp>\n      <SIF_SourceId>canvas</SIF_SourceId>\n    </SIF_Header>\n    <SIF_ProvideObjects/>\n    <SIF_SubscribeObjects>\n      <SIF_Object ObjectName=\"LEAInfo\"/>\n      <SIF_Object ObjectName=\"SchoolInfo\"/>\n      <SIF_Object ObjectName=\"TermInfo\"/>\n      <SIF_Object ObjectName=\"SchoolCourseInfo\"/>\n      <SIF_Object ObjectName=\"SectionInfo\"/>\n      <SIF_Object ObjectName=\"StudentPersonal\"/>\n      <SIF_Object ObjectName=\"StaffPersonal\"/>\n      <SIF_Object ObjectName=\"StudentSectionInfo\"/>\n    </SIF_SubscribeObjects>\n    <SIF_PublishAddObjects/>\n    <SIF_PublishChangeObjects/>\n    <SIF_PublishDeleteObjects/>\n    <SIF_RequestObjects>\n      <SIF_Object ObjectName=\"LEAInfo\"/>\n      <SIF_Object ObjectName=\"SchoolInfo\"/>\n      <SIF_Object ObjectName=\"TermInfo\"/>\n      <SIF_Object ObjectName=\"SchoolCourseInfo\"/>\n      <SIF_Object ObjectName=\"SectionInfo\"/>\n      <SIF_Object ObjectName=\"StudentPersonal\"/>\n      <SIF_Object ObjectName=\"StaffPersonal\"/>\n      <SIF_Object ObjectName=\"StudentSectionInfo\"/>\n    </SIF_RequestObjects>\n    <SIF_RespondObjects/>\n  </SIF_Provision>\n</SIF_Message>"
  end

  it "requests" do
    msg = header_checks_out{builder.request("StudentPersonal")}
    represent(msg).to_xml.should == "<SIF_Message xmlns=\"http://www.sifinfo.org/infrastructure/2.x\" Version=\"2.0r1\">\n  <SIF_Request>\n    <SIF_Header>\n      <SIF_MsgId>GUUID</SIF_MsgId>\n      <SIF_Timestamp>TIME</SIF_Timestamp>\n      <SIF_SourceId>canvas</SIF_SourceId>\n    </SIF_Header>\n    <SIF_Version>2.0r1</SIF_Version>\n    <SIF_MaxBufferSize>64000</SIF_MaxBufferSize>\n    <SIF_Query>\n      <SIF_QueryObject ObjectName=\"StudentPersonal\"/>\n    </SIF_Query>\n  </SIF_Request>\n</SIF_Message>"
  end
end