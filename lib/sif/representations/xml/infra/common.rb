require 'representable'
require 'representable/xml'

require 'sif/infra/common'

%w(
  application
  condition
  condition_group
  data
  error
  event_object
  extended_query
  extended_query_results
  header
  message
  object
  object_data
  other_id
  property
  protocol
  provision
  query
  query_object
  secure_channel
  security
  status
).each do |c|
  require "sif/representations/xml/infra/common/#{c}"
end
