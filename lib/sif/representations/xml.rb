# Pre-load the constants so that we don't need circular requires
module SIF
  module Representation
    module XML
      class Ack < Representable::Decorator; end
      class AgentACL < Representable::Decorator; end
      class Application < Representable::Decorator; end
      class Condition < Representable::Decorator; end
      class ConditionGroup < Representable::Decorator; end
      class Data < Representable::Decorator; end
      class Error < Representable::Decorator; end
      class Event < Representable::Decorator; end
      class EventObject < Representable::Decorator; end
      class ExtendedQuery < Representable::Decorator; end
      class ExtendedQueryResults < Representable::Decorator; end
      class Header < Representable::Decorator; end
      class Message < Representable::Decorator; end
      class Object < Representable::Decorator; end
      class ObjectData < Representable::Decorator; end
      class Property < Representable::Decorator; end
      class Protocol < Representable::Decorator; end
      class Provide < Representable::Decorator; end
      class Provision < Representable::Decorator; end
      class Query < Representable::Decorator; end
      class QueryObject < Representable::Decorator; end
      class Register < Representable::Decorator; end
      class Request < Representable::Decorator; end
      class Response < Representable::Decorator; end
      class SecureChannel < Representable::Decorator; end
      class Security < Representable::Decorator; end
      class Status < Representable::Decorator; end
      class Subscribe < Representable::Decorator; end
      class SystemControl < Representable::Decorator; end
      class Unprovide < Representable::Decorator; end
      class Unprovision < Representable::Decorator; end
      class Unregister < Representable::Decorator; end
      class Unsubscribe < Representable::Decorator; end
      class Vendor < Representable::Decorator; end
      class ZoneStatus < Representable::Decorator; end

      class StudentPersonal < Representable::Decorator; end
    end
  end
end

require 'sif/representations/xml/ack'
# require 'sif/representations/xml/agent_acl'
require 'sif/representations/xml/application'
require 'sif/representations/xml/condition'
require 'sif/representations/xml/condition_group'
require 'sif/representations/xml/data'
require 'sif/representations/xml/error'
require 'sif/representations/xml/event'
# require 'sif/representations/xml/event_object'
# require 'sif/representations/xml/extended_query'
# require 'sif/representations/xml/extended_query_results'
require 'sif/representations/xml/header'
require 'sif/representations/xml/message'
require 'sif/representations/xml/object'
require 'sif/representations/xml/object_data'
require 'sif/representations/xml/property'
require 'sif/representations/xml/protocol'
require 'sif/representations/xml/provide'
require 'sif/representations/xml/provision'
require 'sif/representations/xml/query'
require 'sif/representations/xml/query_object'
require 'sif/representations/xml/register'
require 'sif/representations/xml/request'
require 'sif/representations/xml/response'
require 'sif/representations/xml/secure_channel'
require 'sif/representations/xml/security'
require 'sif/representations/xml/status'
# require 'sif/representations/xml/subscribe'
# require 'sif/representations/xml/system_control'
# require 'sif/representations/xml/unprovide'
# require 'sif/representations/xml/unprovision'
# require 'sif/representations/xml/unregister'
# require 'sif/representations/xml/unsubscribe'
# require 'sif/representations/xml/vendor'
# require 'sif/representations/xml/zone_status'

require 'sif/representations/xml/student_personal'
