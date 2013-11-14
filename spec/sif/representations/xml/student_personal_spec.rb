require_relative 'spec_helper'

describe SIF::Representation::XML::Model::Group::SIS::StudentPersonal do
  let(:xml) { File.read(fixture('sif/student_personal.xml')) }
  let(:student) { SIF::Model::Group::SIS::StudentPersonal.new }

  before do
    SIF::Representation::XML::Model::Group::SIS::StudentPersonal.new(student).
      from_xml(xml)
  end

  it "parses" do
    SIF::Representation::XML::Model::Group::SIS::StudentPersonal.new(student).from_xml(xml);
    student.ref_id.should == 'D3E34B359D75101A8C3D00AA001A1652'
    alert = student.alert_messages[0]
    alert.type.should == 'Legal'
    alert.value.should == 'This is the Legal Alert for Joe Student'
    student.local_id.should == 'P00001'
    student.state_province_id.should == 'WB0025'
    eid = student.electronic_ids[0]
    eid.type.should == 'Barcode'
    eid.value.should == '206654'
    name = student.name
    name.type.should == '04'
    name.last_name.should == 'Student'
    name.first_name.should == 'Joe'
    name.middle_name.should == ''
    name.preferred_name.should == 'Joe'
    student.demographics.gender.should == 'M'
    address = student.addresses[0]
    address.type.should == '0123'
    address.street.line1.should == '6799 33rd Ave.'
    address.street.street_number.should == '6799'
    address.street.street_name.should == '33rd'
    address.street.street_type.should == 'Ave.'
    address.city.should == 'Chicago'
    address.state_province.should == 'IL'
    address.country.should == 'US'
    address.postal_code.should == '60660'
    phone = student.phone_numbers[0]
    phone.type.should == '0096'
    phone.number.should == '(312) 555-1234'
    email = student.emails[0]
    email.type.should == 'Primary'
    email.value.should == 'Joe.Student@anyschool.com'
    student.on_time_graduation_year.should == 2007
  end
end