require_relative "spec_helper"
require "openagent/zone"
require "yaml"

describe OpenAgent::Zone do
  context "initialize" do
    let(:zone) { OpenAgent::Zone.new(:uri => "https://localhost:3000/") }

    it "sets instance variables from config" do
      zone.uri.should == "https://localhost:3000/"
    end
  end

  context "from yaml" do
    let(:zone) { OpenAgent::Zone.new(YAML.load(File.read(fixture("zone.yaml")))) }
    it "sets instance variables from yaml file" do
      zone.uri.should == "http://test.zone.url/zone"
      zone.instance_variable_get("@uri").should == "http://test.zone.url/zone"
    end

    it "sets ssl_config" do
      zone.ssl.verify_mode.should == 0
      zone.ssl.cert_key.should == "cert key"
    end
  end
end