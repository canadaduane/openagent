require 'roxml'

module OpenAgent
  module Message
    module SIF_Message
      class SIF_Message
        include ROXML
        xml_name 'SIF_Message'
        xml_accessor :version,           :from => '@Version'
        xml_accessor :xmlns,             :from => '@xmlns'
        xml_accessor :ack,           :from => 'SIF_Ack'
        xml_accessor :event,         :from => 'SIF_Event'
        xml_accessor :provide,       :from => 'SIF_Provide'
        xml_accessor :register,      :from => 'SIF_Register'
        xml_accessor :request,       :from => 'SIF_Request'
        xml_accessor :response,      :from => 'SIF_Response'
        xml_accessor :subscribe,     :from => 'SIF_Subscribe'
        xml_accessor :systemcontrol, :from => 'SIF_SystemControl'
        xml_accessor :unprovide,     :from => 'SIF_Unprovide'
        xml_accessor :unrequest,     :from => 'SIF_Unrequest'
        xml_accessor :unsubscribe,   :from => 'SIF_Unsubscribe'
      end
    end
  end
end