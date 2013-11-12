require 'virtus'

%w(
  application
  condition
  condition_group
  data
  error
  event
  event_object
  extended_query
  extended_query_results
  header
  message
  object
  object_data
  property
  protocol
  provision
  query
  query_object
  secure_channel
  security
  status
  unprovision
  vendor
).each do |c|
  require "sif/infra/common/#{c}"
end

