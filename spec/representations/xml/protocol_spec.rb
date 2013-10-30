require_relative 'spec_helper'
require 'sif/representations/xml/protocol'
require 'sif/models/protocol'

describe SIF::Representation::XML::Protocol do
  let(:protocol) { SIF::Model::Protocol.new }

  before do
    SIF::Representation::XML::Protocol.new(protocol).from_xml(xml)
  end

  context "url" do
    let(:xml) { File.read(fixture("sif_protocol.xml")) }

    it "parses" do
      protocol.type.should == "HTTPS"
    end

    it "has url" do
      protocol.url.should == "https://AcmeHost:8030/StudentAdmin"
    end
  end

  context "properties" do
    let(:xml) { File.read(fixture("sif_protocol__properties.xml")) }

    it "parses" do
      protocol.type.should == "Custom"
    end

    it "has custom protocols" do
      protocol.properties.size.should == 2
      protocol.properties.map{ |p| p.name }.should == ["CN1", "CN2"]
    end
  end
end