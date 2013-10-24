require 'roxml'

module OpenAgent
  module Message
    module SIF_Ack
      
      class PolymorphicMessage
        attr_reader :event, :response

        def self.from_xml(xml); new(xml); end
        def initialize(xml)
          @xml = xml
          case type
          when :event then
            xml = xml.css('SIF_Event:first').first
            @event = ::OpenAgent::Message::SIF_Event::SIF_Event.from_xml(xml)
          when :response then
            xml = xml.css('SIF_Response:first').first
            @response = ::OpenAgent::Message::SIF_Response::SIF_Response.from_xml(xml)
          end
        end

        def type
          if    event?    then :event
          elsif response? then :response
          else                 :unknown
          end
        end

        def msgid
          send(type).header.msgid
        end

        def timestamp
          send(type).header.timestamp
        end

        def sourceid
          send(type).header.sourceid
        end

        def destinationid
          send(type).header.destinationid
        end

        def xml_event
          @xml / "SIF_Event"
        end

        def xml_response
          @xml / "SIF_Response"
        end

        def event?
          not xml_event.empty?
        end

        def response?
          not xml_response.empty?
        end

        def to_xml
          @xml
        end
      end

      class SIF_Error
        include ROXML
        xml_name 'SIF_Error'
        xml_accessor :category,     :from => 'SIF_Category'
        xml_accessor :code,         :from => 'SIF_Code'
        xml_accessor :desc,         :from => 'SIF_Desc'
        xml_accessor :extendeddesc, :from => 'SIF_ExtendedDesc'
      end
    
      class SIF_Data
        include ROXML
        xml_name 'SIF_Data'
        xml_accessor :message,      :from => 'SIF_Message',
                                    :as   => PolymorphicMessage
        xml_accessor :agentacl,     :from => 'SIF_AgentACL'
        xml_accessor :zonestatus,   :from => 'SIF_ZoneStatus'
      end
    
      class SIF_Status
        include ROXML
        xml_name 'SIF_Status'
        xml_accessor :code,         :from => 'SIF_Code'
        xml_accessor :desc,         :from => 'SIF_Desc'
        xml_accessor :data,         :as   => SIF_Data
      end
    
      class SIF_Ack
        include ROXML
        xml_name 'SIF_Ack'
        xml_accessor :header,           :as   => SIF_Header
        xml_accessor :originalsourceid, :from => 'SIF_OriginalSourceId'
        xml_accessor :originalmsgid,    :from => 'SIF_OriginalMsgId'
        xml_accessor :status,           :as   => SIF_Status
        xml_accessor :error,            :as   => SIF_Error
      end
    
      class SIF_Message
        include ROXML
        xml_name 'SIF_Message'
        xml_accessor :version,      :from => '@Version'
        xml_accessor :xmlns,        :from => '@xmlns'
        xml_accessor :ack,          :as   => SIF_Ack

        def inner_message
          ack.status.data.message if ack && ack.status && ack.status.data
        end
      end
    
    end
  end
end
    