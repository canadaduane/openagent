require 'roxml'
require 'date'


module OpenAgent
  module Message
    module SIF_Response
      class SIF_ObjectData
        include ROXML
        xml_name 'SIF_ObjectData'

        attr_reader :xml

        def datatype
          @xml.css('*:first').first.name
        end

        def self.from_xml(xml)
          super(xml).tap do |inst|
            inst.instance_variable_set("@xml", xml)
          end
        end
      end
    
      class SIF_Response
        include ROXML
        xml_name 'SIF_Event'

        xml_accessor :header,       :as => SIF_Header
        xml_accessor :objectdata,   :as => SIF_ObjectData
        xml_accessor :requestmsgid, :from => 'SIF_RequestMsgId'
        xml_accessor :packetnumber, :from => 'SIF_PacketNumber'
        xml_accessor :morepackets?, :from => 'SIF_MorePackets'
      end
      class SIF_Header
        include ROXML
        xml_name 'SIF_Header'
        xml_accessor :msgid,        :from => 'SIF_MsgId'
        xml_accessor :timestamp,    :from => 'SIF_Timestamp', :as => DateTime
        xml_accessor :sourceid,     :from => 'SIF_SourceId'
      end

      class SIF_Message
        include ROXML
        xml_name 'SIF_Message'
        xml_accessor :version,      :from => '@Version'
        xml_accessor :xmlns,        :from => '@xmlns'
        xml_accessor :response,     :as => SIF_Response
        xml_accessor :header,       :as => SIF_Header
      end
    
    end
  end
end