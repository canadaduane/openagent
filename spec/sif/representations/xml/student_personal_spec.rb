require_relative 'spec_helper'

describe SIF::Representation::Model::Group::SIS::StudentPersonal do
  let(:xml) { File.read(fixture('sif/student_personal.xml')) }
  let(:student) { SIF::Model::Group::SIS::StudentPersonal.new }

  before do
    SIF::Representation::Model::Group::SIS::StudentPersonal.new(student).from_xml(xml)
  end

  it 'parses' do
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

  it 'writes' do
    new_student = SIF::Model::Group::SIS::StudentPersonal.new(
      :ref_id => 'D3E34B359D75101A8C3D00AA001A1652',
      :alert_messages => [
          SIF::Model::Common::AlertMessage.new(
              :type => 'Legal',
              :value => 'This is the Legal Alert for Joe Student'
          )
      ],
      :local_id => 'P00001',
      :state_province_id => 'WB0025',
      :electronic_ids => [
        SIF::Model::Common::ElectronicId.new(
          :type => 'Barcode',
          :value => '206654'
        )
      ],
      :name => SIF::Model::Common::Name.new(
        :type => '04',
        :last_name => 'Student',
        :first_name => 'Joe',
        :middle_name => '',
        :preferred_name => 'Joe'
      ),
      :demographics => SIF::Model::Common::Demographics.new(
        :gender => 'M'
      ),
      :addresses => [
        SIF::Model::Common::Address.new(
          :type => '0123',
          :street => SIF::Model::Common::Street.new(
            :line1 => '6799 33rd Ave.',
            :street_number => '6799',
            :street_name => '33rd',
            :street_type => 'Ave.'
          ),
          :city => 'Chicago',
          :state_province => 'IL',
          :country => 'US',
          :postal_code => '60660',
          :grid_location => SIF::Model::Common::GridLocation.new(
              :latitude => 39.00522,
              :longitude => -95.645111
          ),
        ),
      ],
      :phone_numbers => [
        SIF::Model::Common::PhoneNumber.new(
          :type => '0096',
          :number => '(312) 555-1234'
        )
      ],
      :emails => [
        :type => 'Primary',
        :value => 'Joe.Student@anyschool.com'
      ],
      :on_time_graduation_year => 2007,
      :extended_elements => [
          SIF::Model::Common::ExtendedElement.new(
              :name => 'STUDENT_EMAIL',
              :value => 'email@anyschool.net'
          ),
          SIF::Model::Common::ExtendedElement.new(
              :name => 'PASSWORD',
              :value => 'some_P@ssw0rd'
          ),
        SIF::Model::Common::ExtendedElement.new(
            :name => 'USERNAME',
            :value => 'some_username'
        ),
      ],
    )
    orig_xml = SIF::Representation::Model::Group::SIS::StudentPersonal.new(student).to_xml
    new_xml = SIF::Representation::Model::Group::SIS::StudentPersonal.new(new_student).to_xml
    require 'debugger' ; debugger

    new_xml.should == orig_xml
  end
end