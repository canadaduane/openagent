require_relative 'spec_helper'

describe SIF::Representation::XML::Model::Group::SIS::StudentPersonal do
  let(:xml) { File.read(fixture("sif/student_personal.xml")) }
  let(:student) { SIF::Model::Group::SIS::StudentPersonal.new }

  before do
    SIF::Representation::XML::Model::Group::SIS::StudentPersonal.new(student).
      from_xml(xml)
  end

  it "parses" do
    student.ref_id.should == "D3E34B359D75101A8C3D00AA001A1652"
  end
end