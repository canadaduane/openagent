require_relative "spec_helper"
require "openagent/agent"
require "yaml"

describe OpenAgent::Agent do
  context "new object" do
    let(:agent) { OpenAgent::Agent.new(:name => "SOURCEID") }

    it "sets instance variables from config" do
      agent.name.should == "SOURCEID"
    end

    it ":version has a default value" do
      agent.version.should == "2.0r1"
    end

    it ":source_id uses :name as default value" do
      agent.source_id.should == "SOURCEID"
      agent.source_id.should == agent.name
    end
  end

  context "object from yaml" do
    let(:agent) { OpenAgent::Agent.new(YAML.load(File.read(fixture("agent.yaml")))) }

    it "sets instance variables from yaml file" do
      agent.source_id.should == "canvas"
      agent.instance_variable_get("@source_id").should == "canvas"
      agent.name.should == "Canvas by Instructure"
    end
  end
end