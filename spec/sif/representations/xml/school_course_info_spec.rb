require_relative 'spec_helper'

describe SIF::Representation::XML::Model::Group::SIS::SchoolCourseInfo do
  let(:xml) { File.read(fixture('sif/school_course_info.xml')) }
  let(:course_info) { SIF::Model::Group::SIS::SchoolCourseInfo.new }

  before do
    SIF::Representation::XML::Model::Group::SIS::SchoolCourseInfo.new(course_info).from_xml(xml)
  end

  it 'parses' do
    course_info.ref_id.should == '9D75101A8C3D00AA001A0000A2E35B35'
    course_info.school_info_ref_id.should == '101A8C3D00AA001A0000A2E35B359D75'
    course_info.school_year.should == '2006'
    course_info.course_code.should == 'CS101'
    course_info.state_course_code.should == '08-001'
    course_info.district_course_code.should == 'CS101'
    area = course_info.subject_areas[0]
      area.code.should == '05'
      area.other_codes[0].code_set.should == 'Text'
      area.other_codes[0].value.should == 'Graphic Arts'
    course_info.course_title.should == "Gif, JPeg, or Png: What's the Difference?"
    course_info.description.should == 'Explore the various types of files related to graphic arts.'
    (course_info.instructional_level.include? '0571').should == true
    course_info.course_credits == '2'
    course_info.core_academic_course.should == 'No'
    course_info.graduation_requirement.should == 'No'
  end
end