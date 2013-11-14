require "sif/models/groups/sis/student_personal"


# attendance_code_info
# calendar_date
# discipline_incident
# school_info
#term_info
%w(
  lea_info
  student_personal
  section_info
  school_course_info
  section_info

  staff_personal
  student_section_enrollment
).each do |c|
  require "sif/models/groups/sis/#{c}"
end