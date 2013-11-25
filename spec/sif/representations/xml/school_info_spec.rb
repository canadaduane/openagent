require_relative 'spec_helper'

describe SIF::Representation::Model::Group::SIS::SchoolInfo do
  let(:xml) { File.read(fixture('sif/school_info.xml')) }
  let(:school_info) { SIF::Model::Group::SIS::SchoolInfo.new }

  before do
    SIF::Representation::Model::Group::SIS::SchoolInfo.new(school_info).from_xml(xml)
  end

  it 'parses' do
    school_info.ref_id.should == 'D3E34B359D75101A8C3D00AA001A1652'
    school_info.local_id.should == '946379881'
    school_info.state_province_id == 'C2345681'
    school_info.nces_id.should == '421575003045'
    school_info.school_name.should == 'Lincoln High School'
    school_info.lea_info_ref_id.should == '73648462888624AA5294BC6380173276'
    school_info.school_type.should == 'K12'
    school_info.other_lea.include?('AA648462888624AA5294BC638017320B').should be_true
    school_info.school_focuses[0].should == 'Regular'
    school_info.school_url.should == 'http://www.lincolnhs.edu'
    school_info.principal_info.contact_name.should == 'Richard Knudson'
    school_info.principal_info.contact_title.should == 'Dr.'

    school_contact = school_info.school_contacts[0]
    school_contact.publish_in_directory.should be_true
    contact_info = school_contact.contact_info
    contact_info.name.type.should == '04'
    contact_info.name.first_name.should == 'James'
    contact_info.name.last_name.should == 'Miller'
    contact_info.position_title.should == 'Office Assistant'
    contact_info.emails[0].type.should == 'Primary'
    contact_info.emails[0].value.should == 'jmiller@lhs.k12.state.us'
    contact_info.phone_numbers[0].type.should == '0096'
    contact_info.phone_numbers[0].number.should == '(555) 555-1235'

    school_info.phone_numbers[0].type.should == '0096'
    school_info.phone_numbers[0].number.should == '(555) 555-1234'
    school_info.session_type.should == '0830'
    school_info.grade_levels.include?('09').should be_true
    school_info.grade_levels.include?('10').should be_true
    school_info.grade_levels.include?('11').should be_true
    school_info.grade_levels.include?('12').should be_true
    school_info.title_1_status.should == 'Targeted'
    school_info.operational_status.should == '0820'
    school_info.congressional_district.should == '3'
  end
end