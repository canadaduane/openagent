require "sif/models/groups/sis/student_personal"


# attendance_code_info
# calendar_date
# discipline_incident
# school_info
%w(
  lea_info
  school_info
  section_info
  student_personal
  staff_personal
  term_info
).each do |c|
  require "sif/models/groups/sis/#{c}"
end