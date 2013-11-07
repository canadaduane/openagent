require 'representable'
require 'representable/xml'

require 'sif/infra/common'

%w(
  application
  condition
  condition_group
  data
  error
  header
  message
  object
  object_data
  other_id
  property
  protocol
  query
  query_object
  secure_channel
  security
  status
).each do |c|
  require "sif/representations/xml/infra/common/#{c}"
end
