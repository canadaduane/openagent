# Pre-load the constants so that we don't need circular requires
module SIF
  module Representation
    module XML
    
      module Model
        module Group
          module SIS
            class Address < Representable::Decorator; end
            class StudentPersonal < Representable::Decorator; end
          end
        end
      end

      module Infra
        module Message
          class Ack < Representable::Decorator; end
          class AgentACL < Representable::Decorator; end
          class AlertMessage < Representable::Decorator; end
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
          class MedicalAlertMessage < Representable::Decorator; end
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
        end
      end
    end
  end
end

require 'sif/representations/xml/infra/messages/ack'
# require 'sif/representations/xml/infra/messages/agent_acl'
require 'sif/representations/xml/infra/messages/alert_message'
require 'sif/representations/xml/infra/messages/application'
require 'sif/representations/xml/infra/messages/condition'
require 'sif/representations/xml/infra/messages/condition_group'
require 'sif/representations/xml/infra/messages/data'
require 'sif/representations/xml/infra/messages/electronic_id'
require 'sif/representations/xml/infra/messages/error'
require 'sif/representations/xml/infra/messages/event'
# require 'sif/representations/xml/infra/messages/event_object'
# require 'sif/representations/xml/infra/messages/extended_query'
# require 'sif/representations/xml/infra/messages/extended_query_results'
require 'sif/representations/xml/infra/messages/header'
require 'sif/representations/xml/infra/messages/medical_alert_message'
require 'sif/representations/xml/infra/messages/message'
require 'sif/representations/xml/infra/messages/object'
require 'sif/representations/xml/infra/messages/object_data'
require 'sif/representations/xml/infra/messages/other_id'
require 'sif/representations/xml/infra/messages/property'
require 'sif/representations/xml/infra/messages/protocol'
require 'sif/representations/xml/infra/messages/provide'
require 'sif/representations/xml/infra/messages/provision'
require 'sif/representations/xml/infra/messages/query'
require 'sif/representations/xml/infra/messages/query_object'
require 'sif/representations/xml/infra/messages/register'
require 'sif/representations/xml/infra/messages/request'
require 'sif/representations/xml/infra/messages/response'
require 'sif/representations/xml/infra/messages/secure_channel'
require 'sif/representations/xml/infra/messages/security'
require 'sif/representations/xml/infra/messages/status'
# require 'sif/representations/xml/infra/messages/subscribe'
# require 'sif/representations/xml/infra/messages/system_control'
# require 'sif/representations/xml/infra/messages/unprovide'
# require 'sif/representations/xml/infra/messages/unprovision'
# require 'sif/representations/xml/infra/messages/unregister'
# require 'sif/representations/xml/infra/messages/unsubscribe'
# require 'sif/representations/xml/infra/messages/vendor'
# require 'sif/representations/xml/infra/messages/zone_status'
