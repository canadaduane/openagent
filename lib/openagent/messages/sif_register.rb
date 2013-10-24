require 'roxml'

module OpenAgent
  module Message
    module SIF_Register

      class SIF_Application
        include ROXML
        xml_name 'SIF_Application'
        xml_accessor :vendor,  :from => 'SIF_Vendor'
        xml_accessor :product, :from => 'SIF_Product'
        xml_accessor :version, :from => 'SIF_Version'
      end

      class SIF_Register
        include ROXML
        xml_name 'SIF_Register'
  
        xml_accessor :header,        :as => SIF_Header
        xml_accessor :name,          :from => 'SIF_Name'
        xml_accessor :version,       :from => 'SIF_Version'
        xml_accessor :maxbuffersize, :from => 'SIF_MaxBufferSize'
        xml_accessor :mode,          :from => 'SIF_Mode'
        xml_accessor :protocol,      :from => 'SIF_Protocol'
        xml_accessor :nodevendor,    :from => 'SIF_Vendor'
        xml_accessor :nodeversion,   :from => 'SIF_NodeVersion'
        xml_accessor :icon,          :from => 'SIF_Icon'
      end

      class SIF_Message
        include ROXML
        xml_name 'SIF_Message'
        xml_accessor :version,      :from => '@Version'
        xml_accessor :xmlns,        :from => '@xmlns'
        xml_accessor :register, :as => SIF_Register
      end
      
    end
  end
end