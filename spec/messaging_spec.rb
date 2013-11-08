require_relative 'spec_helper'

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

end