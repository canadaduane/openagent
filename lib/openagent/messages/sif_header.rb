require 'roxml'
require 'date'

module OpenAgent
  module Message
    class SIF_SecureChannel
      include ROXML
      xml_name 'SIF_SecureChannel'
      xml_accessor :authenticationlevel, :from => 'SIF_AuthenticationLevel'
      xml_accessor :encryptionlevel,     :from => 'SIF_EncryptionLevel'
    end

    class SIF_Security
      include ROXML
      xml_name 'SIF_Security'
      xml_accessor :securechannel, :as => SIF_SecureChannel
    end

    class SIF_Header
      include ROXML
      xml_name 'SIF_Header'
  
       xml_accessor :msgid,         :from => 'SIF_MsgId'
       xml_accessor :timestamp,     :from => 'SIF_Timestamp', :as => DateTime
       xml_accessor :security,      :as => SIF_Security
       xml_accessor :sourceid,      :from => 'SIF_SourceId'
       xml_accessor :destinationId, :from => 'SIF_DestinationId'
       xml_accessor :contexts,      :from => 'SIF_Contexts'
    end
  end
end
