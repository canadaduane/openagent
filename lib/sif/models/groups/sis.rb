require "sif/models/groups/sis/student_personal"


%w(
  student_personal
).each do |c|
  require "sif/models/groups/sis/#{c}"
end