require 'virtus'

require_relative 'common'

%w(
  ack
  event
  ping
  provide
  provision
  register
  request
  response
  sleep
  subscribe
  system_control
  unprovide
  unregister
  unsubscribe
  wakeup
).each do |c|
  require "sif/infra/messages/#{c}"
end
