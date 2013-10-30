require_relative 'spec_helper'
require 'sif/representations/xml/header'
require 'sif/models/header'

describe SIF::Representation::XML::Header do
  let(:xml) { File.read(fixture("sif_header.xml")) }
  let(:header) { SIF::Model::Header.new }

  before do
    SIF::Representation::XML::Header.new(header).from_xml(xml)
  end

  it "parses" do
    header.msg_id.should == "A3E90785EFDA330DACB00785EFDA330E"
  end

  it "has source_id" do
    header.source_id.should == "RamseyLIB"
  end

  it "has destination_id" do
    header.destination_id.should == "RamseySIS"
  end

  it "has authentication_level" do
    header.authentication_level.should == 3
  end

  it "has encryption_level" do
    header.encryption_level.should == 4
  end
end