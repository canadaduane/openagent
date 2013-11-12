require 'virtus'

%w(
  address
  alert_message
  base_name
  code
  contact_info
  credits_attempted
  demographics
  dwelling_arrangement
  earned_status
  electronic_id
  english_proficiency
  email
  exceptionality_category
  grade_level
  grid_location
  identification_info
  language
  meal_status
  medical_alert_message
  meeting_time
  name
  other_code
  other_id
  phone_number
  principal_info
  race
  sced_code
  schedule_info
  schedule_info_override
  school_contact
  school_course_info_override
  street
  subject_area
).each do |c|
  require "sif/models/common/#{c}"
end
