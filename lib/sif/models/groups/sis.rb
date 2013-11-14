require "sif/models/groups/sis/student_personal"


# attendance_code_info
# calendar_date
# discipline_incident
# school_info
%w(
  lea_info
  student_personal
).each do |c|
  require "sif/models/groups/sis/#{c}"
end