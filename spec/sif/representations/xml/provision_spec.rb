require_relative 'spec_helper'

describe SIF::Representation::XML::Infra::Message::Provision do
  let(:xml) { File.read(fixture("sif_provision.xml")) }
  let(:provision) { SIF::Infra::Message::Provision.new }

  before do
    SIF::Representation::XML::Infra::Message::Provision.new(provision).from_xml(xml)
  end

  it "parses" do
    provision.header.msg_id.should == "A10F92EB649F4A648B5BFC44C7FD965C"
  end

  it "has provide_objects" do
    provision.provide_objects.size.should == 2
    provision.provide_objects.map{ |o| o.object_name }.should ==
      ["StudentPersonal", "StudentSchoolEnrollment"]
  end

  it "has subscribe_objects" do
    provision.subscribe_objects.size.should == 1
    provision.subscribe_objects.map{ |o| o.object_name }.should ==
      ["StudentPicture"]
  end

  it "has publish_add_objects" do
    provision.publish_add_objects.size.should == 2
    provision.publish_add_objects.map{ |o| o.object_name }.should ==
      ["StudentPersonal", "StudentSchoolEnrollment"]
  end

  it "has publish_change_objects" do
    provision.publish_change_objects.size.should == 2
    provision.publish_change_objects.map{ |o| o.object_name }.should ==
      ["StudentPersonal", "StudentSchoolEnrollment"]
  end

  it "has publish_delete_objects" do
    provision.publish_delete_objects.size.should == 2
    provision.publish_delete_objects.map{ |o| o.object_name }.should ==
      ["StudentPersonal", "StudentSchoolEnrollment"]
  end

  it "has request_objects" do
    provision.request_objects.size.should == 1
    provision.request_objects.map{ |o| o.object_name }.should ==
      ["StudentPicture"]
  end

  it "has respond_objects" do
    provision.respond_objects.size.should == 2
    provision.respond_objects.map{ |o| o.object_name }.should ==
      ["StudentPersonal", "StudentSchoolEnrollment"]
  end
end