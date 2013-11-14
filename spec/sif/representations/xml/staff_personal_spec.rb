require_relative 'spec_helper'

describe SIF::Representation::XML::Model::Group::SIS::StaffPersonal do
  let(:xml) { File.read(fixture('sif/staff_personal.xml')) }
  let(:staff) { SIF::Model::Group::SIS::StaffPersonal.new }

  before do
    SIF::Representation::XML::Model::Group::SIS::StaffPersonal.new(staff).from_xml(xml)
  end

  it 'parses' do
    staff.ref_id.should == 'D3E34F419D75101A8C3D00AA001A1652'
    staff.local_id.should == '946379881'
    staff.state_province_id.should == 'C2345681'
    eid = staff.electronic_ids[0]
    eid.type.should == 'Barcode'
    eid.value.should == '206655'
    name = staff.name
    name.type.should == '04'
    name.prefix.should == 'Mr.'
    name.last_name.should == 'Woodall'
    name.first_name.should == 'Charles'
    name.middle_name.should == 'William'
    name.preferred_name.should == 'Chuck'
    staff.demographics.gender.should == 'M'
    address = staff.addresses[0]
    address.type.should == '0123'
    address.street.line1.should == '6799 33rd Ave.'
    address.street.street_number.should == '6799'
    address.street.street_name.should == '33rd'
    address.street.street_type.should == 'Ave.'
    address.city.should == 'Chicago'
    address.state_province.should == 'IL'
    address.country.should == 'US'
    address.postal_code.should == '60660'
    phone = staff.phone_numbers[0]
    phone.type.should == '0096'
    phone.number.should == '(312) 555-1234'
    email = staff.emails[0]
    email.type.should == 'Primary'
    email.value.should == 'chuckw@imginc.com'
    staff.employee_personal_ref_id.should == '1652D3E34F419D75101A8C3D00AA001A'
  end

  it 'writes' do
    new_staff = SIF::Model::Group::SIS::StaffPersonal.new(
        :ref_id => 'D3E34F419D75101A8C3D00AA001A1652',
        :local_id => '946379881',
        :state_province_id => 'C2345681',
        :electronic_ids => [
            SIF::Model::Common::ElectronicId.new(
                :type => 'Barcode',
                :value => '206655'
            )
        ],
        :other_ids => SIF::Model::Common::OtherId.new(
          :type => '0004',
          :value => '333333333'
        ),
        :name => SIF::Model::Common::Name.new(
            :type => '04',
            :prefix => 'Mr.',
            :last_name => 'Woodall',
            :first_name => 'Charles',
            :middle_name => 'William',
            :preferred_name => 'Chuck'
        ),
        :demographics => SIF::Model::Common::Demographics.new(
            :gender => 'M'
        ),
        :title => 'Principal',
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
                :postal_code => '60660'
            )
        ],
        :phone_numbers => [
            SIF::Model::Common::PhoneNumber.new(
                :type => '0096',
                :number => '(312) 555-1234'
            )
        ],
        :emails => [
            :type => 'Primary',
            :value => 'chuckw@imginc.com'
        ],
        :employee_personal_ref_id => '1652D3E34F419D75101A8C3D00AA001A'
    )

    orig_xml = SIF::Representation::XML::Model::Group::SIS::StaffPersonal.new(staff).to_xml
    new_xml = SIF::Representation::XML::Model::Group::SIS::StaffPersonal.new(new_staff).to_xml

    new_xml.should == orig_xml
  end
end