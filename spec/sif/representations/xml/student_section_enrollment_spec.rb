require_relative 'spec_helper'

describe SIF::Representation::Model::Group::SIS::StudentSectionEnrollment do
  let(:xml) { File.read(fixture('sif/student_section_enrollment.xml')) }
  let(:student_se) { SIF::Model::Group::SIS::StudentSectionEnrollment.new }

  before do
    SIF::Representation::Model::Group::SIS::StudentSectionEnrollment.new(student_se).from_xml(xml)
  end

  it 'parses' do
    student_se.ref_id.should == '983AC16598793002C3D00AA00456789D'
    student_se.student_personal_ref_id.should == 'CAE293165987101A8C3D00AA00456789'
    student_se.section_info_ref_id.should == '9076AB23E386112B7EA2256100BB3312'
    student_se.school_year.should == '2002'
    student_se.entry_date.to_s.should == '2001-09-05'
    student_se.exit_date.to_s.should == '2002-03-01'

    sched_override = student_se.schedule_info_overrides[0]
    sched_override.override.should be_true
    sched_override.term_info_ref_id.should == '099BBC3227490063E97403434C5C2207'
    meeting_time = sched_override.meeting_times[0]
    meeting_time.timetable_day.should == 'M'
    meeting_time.timetable_period.should == '6'
    meeting_time = sched_override.meeting_times[1]
    meeting_time.timetable_day.should == 'W'
    meeting_time.timetable_period.should == '6'
    meeting_time = sched_override.meeting_times[2]
    meeting_time.timetable_day.should == 'F'
    meeting_time.timetable_period.should == '6'

    sched_override = student_se.schedule_info_overrides[1]
    sched_override.override.should be_true
    sched_override.term_info_ref_id.should == 'A2334007263E97403434C5C220798765'
    meeting_time = sched_override.meeting_times[0]
    meeting_time.timetable_day.should == 'M'
    meeting_time.timetable_period.should == '4'
    meeting_time = sched_override.meeting_times[1]
    meeting_time.timetable_day.should == 'W'
    meeting_time.timetable_period.should == '4'
    meeting_time = sched_override.meeting_times[2]
    meeting_time.timetable_day.should == 'F'
    meeting_time.timetable_period.should == '4'

    student_se.credits_attempted.type.should == '0588'
    student_se.credits_attempted.value.should == '1'
  end
end