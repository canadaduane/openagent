require_relative 'spec_helper'

describe SIF::Representation::XML::Infra::Message::Register do
  let(:xml) { File.read(fixture("sif_register.xml")) }
  let(:register) { SIF::Infra::Message::Register.new }

  before do
    SIF::Representation::XML::Infra::Message::Register.new(register).from_xml(xml)
  end

  it "parses" do
    register.name.should == "Acme Agent for WAP 2.x"
    register.max_buffer_size.should == 524288
    register.protocol.secure.should be_true
    register.application.version.should == '5.1.2'
  end
end