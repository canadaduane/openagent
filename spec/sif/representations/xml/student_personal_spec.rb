require_relative 'spec_helper'

describe SIF::Representation::XML::Model::Group::SIS::StudentPersonal do
  let(:xml) { File.read(fixture("student_personal.xml")) }
  let(:student) { SIF::Model::Group::SIS::StudentPersonal.new }

  before do
    SIF::Representation::XML::Model::Group::SIS::StudentPersonal.new(student).from_xml(xml)
  end

  it "parses" do
    student.version.should == "2.*"
  end
end