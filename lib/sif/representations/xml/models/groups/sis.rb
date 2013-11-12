require 'sif/models'
require 'sif/representations/xml/models'
require 'sif/representations/xml/models/common'

%w(
  personal_representer
  school_course_info
  school_info
  section_info
  sis_representer
  staff_personal
  student_personal
  student_section_enrollment
  term_info
).each do |c|
  require "sif/representations/xml/models/groups/sis/#{c}"
end