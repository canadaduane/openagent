require 'representable'
require 'representable/xml'

%w(
  address
  alert_message
  electronic_id
  language
  medical_alert_message
).each do |c|
  require "sif/representations/xml/models/common/#{c}"
end
