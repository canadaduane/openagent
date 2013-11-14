require 'representable'
require 'representable/xml'

%w(
  address
  alert_message
  contact_info
  credits_attempted
  demographics
  dwelling_arrangement
  electronic_id
  email
  english_proficiency
  identification_info
  language
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
  require "sif/representations/xml/models/common/#{c}"
end
