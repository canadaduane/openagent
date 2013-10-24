require_relative "spec_helper"
require "openagent/zone"

describe OpenAgent::Zone do
  context "initialize" do
    let(:zone) { OpenAgent::Zone.new(:use_ssl => true) }
    it "sets instance variables from config" do
      zone.use_ssl.should be_true
    end
  end

  context "from yaml" do
    let(:zone) { OpenAgent::Zone.from_yaml(fixture("zone.yaml")) }
    it "sets instance variables from yaml file" do
      zone.uri.should == "http://test.zone.url/zone"
      zone.instance_variable_get("@uri").should == "http://test.zone.url/zone"
    end
    it "does not set unknown variables from yaml file" do
      zone.instance_variable_get("@puts_msg_before_post").should be_nil
    end
  end
end