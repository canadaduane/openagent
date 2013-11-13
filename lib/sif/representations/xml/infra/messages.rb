require 'representable'
require 'representable/xml'

require 'sif/infra/messages'
require 'sif/representations/xml/infra/common'

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
  system_control
  subscribe
  sleep
  wakeup
).each do |c|
  require "sif/representations/xml/infra/messages/#{c}"
end
