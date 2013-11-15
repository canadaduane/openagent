require_relative 'spec_helper'

describe SIF::Representation::Infra::Common::Protocol do
  let(:protocol) { SIF::Infra::Common::Protocol.new }

  before do
    SIF::Representation::Infra::Common::Protocol.new(protocol).from_xml(xml)
  end

  context "url" do
    let(:xml) { File.read(fixture("sif/sif_protocol.xml")) }

    it "parses" do
      protocol.type.should == "HTTPS"
    end

    it "has url" do
      protocol.url.should == "https://AcmeHost:8030/StudentAdmin"
    end
  end

  context "properties" do
    let(:xml) { File.read(fixture("sif/sif_protocol__properties.xml")) }

    it "parses" do
      protocol.type.should == "Custom"
    end

    it "has custom protocols" do
      protocol.properties.size.should == 2
      protocol.properties.map{ |p| p.name }.should == ["CN1", "CN2"]
    end
  end
end