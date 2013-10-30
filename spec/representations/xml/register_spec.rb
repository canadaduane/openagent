require_relative 'spec_helper'
require 'sif/representations/xml/register'
require 'sif/models/register'

describe SIF::Representation::XML::Register do
  let(:xml) { File.read(fixture("sif_register.xml")) }
  let(:register) { SIF::Model::Register.new }

  before do
    SIF::Representation::XML::Register.new(register).from_xml(xml)
  end

  it "parses" do
    register.name.should == "Acme Agent for WAP 2.x"
  end
end