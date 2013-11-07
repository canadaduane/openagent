require 'virtus'

%w(
  address
  alert_message
  base_name
  code
  contact_info
  demographics
  earned_status
  electronic_id
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
  other_id
  phone_number
  street
).each do |c|
  require "sif/models/common/#{c}"
end
