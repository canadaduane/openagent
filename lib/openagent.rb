require 'openagent/message_builder'
require 'openagent/zone'
require 'openagent/agent'
require 'openagent/client'

require 'active_support/inflector'

def repr(obj)
  obj.class.to_s.sub('SIF::', 'SIF::Representation::').constantize.new(obj)
end