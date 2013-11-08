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
  end

  it "unregisters" do
    header_checks_out{ messaging.unregister }
  end

  it "requests" do
    header_checks_out{ messaging.request("StudentPersonal", nil) }
  end

  it "pings" do
    header_checks_out{ messaging.ping }
  end

  it "sleeps" do
    header_checks_out{ messaging.sleep }
  end

  it "wakes up" do
    header_checks_out{ messaging.wakeup }
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