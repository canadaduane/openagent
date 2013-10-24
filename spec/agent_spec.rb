require_relative "spec_helper"
require "openagent/agent"

describe OpenAgent::Agent do
  context "initialize" do
    let(:agent) { OpenAgent::Agent.new(:sourceid => "SOURCEID") }
    it "sets instance variables from config" do
      agent.sourceid.should == "SOURCEID"
    end
  end

  context "from yaml" do
    let(:agent) { OpenAgent::Agent.from_yaml(fixture("agent.yaml")) }
    it "sets instance variables from yaml file" do
      agent.sourceid.should == "TEST_SOURCEID"
      agent.instance_variable_get("@sourceid").should == "TEST_SOURCEID"
    end
  end
end