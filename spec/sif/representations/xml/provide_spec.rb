require_relative 'spec_helper'

describe SIF::Representation::Infra::Message::Provide do
  let(:xml) { File.read(fixture("sif/sif_provide.xml")) }
  let(:provide) { SIF::Infra::Message::Provide.new }

  before do
    SIF::Representation::Infra::Message::Provide.new(provide).from_xml(xml)
  end

  it "should parse" do
    provide.header.msg_id.should == "34DC87FE3261545A31905937B265CE01"
    provide.objects.size.should == 2
  end

  it "should list object_names" do
    provide.object_names.should == ["StudentPersonal", "StudentSchoolEnrollment"]
  end
end