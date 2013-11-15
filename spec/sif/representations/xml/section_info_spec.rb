require_relative 'spec_helper'

describe SIF::Representation::XML::Model::Group::SIS::SectionInfo do
  let(:xml) { File.read(fixture('sif/section_info.xml')) }
  let(:section_info) { SIF::Model::Group::SIS::SectionInfo.new }

  before do
    SIF::Representation::XML::Model::Group::SIS::SectionInfo.new(section_info).from_xml(xml)
  end

  it 'parses' do
    section_info.ref_id.should == 'D3E34B359D75101A8C3D00AA001A1652'
    section_info.school_course_info_ref_id.should == 'A2E35B359D75101A8C3D00AA001A0000'
    section_info.school_year.should == '2006'
    section_info.local_id.should == '287-1'
    schedule_info = section_info.schedule_infos[0]
      schedule_info.teachers[0].should == 'A8C3A2E35B359D75101D00AA001A0000'
      schedule_info.teachers[1].should == 'A8C45DC6B3359D75101D00A456BE9000'
      schedule_info.section_rooms[0].should == '94785736AB3671090BDD87593A264086'
      meeting_times = schedule_info.meeting_times
      meeting_times[0].timetable_day.should == 'M'
      meeting_times[0].timetable_period.should == '6'
      meeting_times[1].timetable_day.should == 'T'
      meeting_times[1].timetable_period.should == '6'
      meeting_times[2].timetable_day.should == 'W'
      meeting_times[2].timetable_period.should == '6'
      meeting_times[3].timetable_day.should == 'R'
      meeting_times[3].timetable_period.should == '6'
      meeting_times[4].timetable_day.should == 'F'
      meeting_times[4].timetable_period.should == '6'
    schedule_info = section_info.schedule_infos[1]
      schedule_info.teachers[0].should == 'CC543E35B359D75101D00AA001A00703'
      schedule_info.section_rooms[0].should == '94785736AB3671090BDD87593A264086'
      meeting_times = schedule_info.meeting_times
      meeting_times[0].timetable_day.should == 'M'
      meeting_times[0].timetable_period.should == '4'
      meeting_times[1].timetable_day.should == 'T'
      meeting_times[1].timetable_period.should == '4'
      meeting_times[2].timetable_day.should == 'W'
      meeting_times[2].timetable_period.should == '4'
      meeting_times[3].timetable_day.should == 'R'
      meeting_times[3].timetable_period.should == '4'
      meeting_times[4].timetable_day.should == 'F'
      meeting_times[4].timetable_period.should == '4'
    section_info.medium_of_instruction.strip.should == '0605'
    section_info.language_of_instruction.strip.should == 'eng'
    (section_info.location_of_instruction.include? '0340').should == true
    (section_info.location_of_instruction.include? 'Pennsylvania College of Technology').should == true
    override = section_info.school_course_info_override
      override.override.should == 'Yes'
      override.course_code.should == 'CS101A'
      override.state_course_code.should == '08-001A'
      override.district_course_code.should == 'CS101A'
      area = override.subject_area
        (area.include? '05').should == true
        (area.include? 'Graphic Arts for Beginners').should == true
      override.course_title.should == 'Graphics Basics'
      override.instructional_level.strip.should == '0570'
      override.course_credits.should == '0.50'
  end
end