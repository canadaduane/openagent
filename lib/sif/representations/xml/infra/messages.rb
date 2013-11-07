require 'representable'
require 'representable/xml'

require 'sif/infra/messages'
require 'sif/representations/xml/infra/common'

#system_control
#unprovide
#unregister
#unsubscribe
%w(
  ack
  event
  ping
  provide
  provision
  register
  request
  response
  subscribe
  sleep
  wakeup
).each do |c|
  require "sif/representations/xml/infra/common/#{c}"
end
