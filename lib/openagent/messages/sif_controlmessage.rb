require 'roxml'

module OpenAgent
  module Message
    module SIF_SystemControl
      class SIF_Ping
        include ROXML
        xml_name 'SIF_Ping'
      end

      class SIF_Sleep
        include ROXML
        xml_name 'SIF_Sleep'
      end
    
      class SIF_Wakeup
        include ROXML
        xml_name 'SIF_Wakeup'
      end
    
      class SIF_GetMessage
        include ROXML
        xml_name 'SIF_GetMessage'
      end
      class SIF_GetZoneStatus
        include ROXML
        xml_name 'SIF_GetZoneStatus'
      end
      class SIF_GetAgentACL
        include ROXML
        xml_name 'SIF_GetAgentACL'
      end
    
      class SIF_RequestMsgId
        include ROXML
        xml_name 'SIF_RequestMsgId'
        xml_accessor :requestmsgid, :from => 'SIF_RequestMsgId'
      end
    
      class SIF_CancelRequest
        include ROXML
        xml_name 'SIF_CancelRequest'
        xml_accessor :notificationtype, :from => 'SIF_NotificationType'
        xml_accessor :requestmsgids,    :as => [SIF_RequestMsgId]
      end
    
    
      class SIF_SystemControlData
        include ROXML
        xml_name 'SIF_SystemControlData'
        xml_accessor :ping,       :as => SIF_Ping
        xml_accessor :sleep,      :as => SIF_Sleep
        xml_accessor :wakeup,     :as => SIF_Wakeup
        xml_accessor :getmessage, :as => SIF_GetMessage
        xml_accessor :getzonestatus, :as => SIF_GetZoneStatus
        xml_accessor :getagentacl,   :as => SIF_GetAgentACL
        xml_accessor :cancelRequest, :as => SIF_CancelRequest
      
      end
    
      class SIF_SystemControl
        include ROXML
        xml_name 'SIF_SystemControl'
        xml_accessor :header,            :as => SIF_Header
        xml_accessor :systemcontroldata, :as => SIF_SystemControlData
      end
    
      class SIF_Message
        include ROXML
        xml_name 'SIF_Message'
        xml_accessor :version,           :from => '@Version'
        xml_accessor :xmlns,             :from => '@xmlns'
        xml_accessor :systemcontrol, :as => SIF_SystemControl
      end
    
    end
  end
end