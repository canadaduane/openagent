module SIF
  module Message
    class Ack; end
    class AgentACL; end
    class Application; end
    class Condition; end
    class ConditionGroup; end
    class Data; end
    class Error; end
    class Event; end
    class EventObject; end
    class ExtendedQuery; end
    class ExtendedQueryResults; end
    class Header; end
    class Message; end
    class Object; end
    class ObjectData; end
    class Property; end
    class Protocol; end
    class Provide; end
    class Provision; end
    class Query; end
    class QueryObject; end
    class Register; end
    class Request; end
    class Response; end
    class SecureChannel; end
    class Security; end
    class Status; end
    class Subscribe; end
    class SystemControl; end
    class Unprovide; end
    class Unprovision; end
    class Unregister; end
    class Unsubscribe; end
    class Vendor; end
    class ZoneStatus; end
  end
end

require 'virtus'

require 'sif/messages/ack'
require 'sif/messages/agent_acl'
require 'sif/messages/application'
require 'sif/messages/condition'
require 'sif/messages/condition_group'
require 'sif/messages/data'
require 'sif/messages/error'
require 'sif/messages/event'
require 'sif/messages/event_object'
require 'sif/messages/extended_query'
require 'sif/messages/extended_query_results'
require 'sif/messages/header'
require 'sif/messages/message'
require 'sif/messages/object'
require 'sif/messages/object_data'
require 'sif/messages/property'
require 'sif/messages/protocol'
require 'sif/messages/provide'
require 'sif/messages/provision'
require 'sif/messages/query'
require 'sif/messages/query_object'
require 'sif/messages/register'
require 'sif/messages/request'
require 'sif/messages/response'
require 'sif/messages/secure_channel'
require 'sif/messages/security'
require 'sif/messages/status'
require 'sif/messages/subscribe'
require 'sif/messages/system_control'
require 'sif/messages/unprovide'
require 'sif/messages/unprovision'
require 'sif/messages/unregister'
require 'sif/messages/unsubscribe'
require 'sif/messages/vendor'
require 'sif/messages/zone_status'
