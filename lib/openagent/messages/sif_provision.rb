require 'roxml'

module OpenAgent
  module Message
    module SIF_Provision
        
      class SIF_Object
        include ROXML
        xml_name 'SIF_Object'
        xml_accessor :objectname, :from => '@ObjectName'
      end

      class SIF_ProvideObjects
        include ROXML
        xml_name 'SIF_ProvideObjects'
        xml_accessor :objects, :as => [SIF_Object]
      end

      class SIF_SubscribeObjects
        include ROXML
        xml_name 'SIF_SubscribeObjects'
        xml_accessor :objects, :as => [SIF_Object]
      end

      class SIF_PublishChangeObjects
        include ROXML
        xml_name 'SIF_PublishChangeObjects'
        xml_accessor :objects, :as => [SIF_Object]
      end

      class SIF_PublishAddObjects
        include ROXML
        xml_name 'SIF_PublishAddObjects'
        xml_accessor :objects, :as => [SIF_Object]
      end

      class SIF_PublishDeleteObjects
        include ROXML
        xml_name 'SIF_PublishDeleteObjects'
        xml_accessor :objects, :as => [SIF_Object]
      end

      class SIF_RequestObjects
        include ROXML
        xml_name 'SIF_RequestObjects'
        xml_accessor :objects, :as => [SIF_Object]
      end

      class SIF_RespondObjects
        include ROXML
        xml_name 'SIF_RespondObjects'
        xml_accessor :objects, :as => [SIF_Object]
      end

      class SIF_Provision
        include ROXML
        xml_name 'SIF_Provision'

        xml_accessor :header, :as => SIF_Header
        xml_accessor :provideobjects, :as => SIF_ProvideObjects
        xml_accessor :subscribeobjects, :as => SIF_SubscribeObjects
        xml_accessor :publishaddobjects, :as => SIF_PublishAddObjects
        xml_accessor :publishchangeobjects, :as => SIF_PublishChangeObjects
        xml_accessor :publishdeleteobjects, :as => SIF_PublishDeleteObjects
        xml_accessor :requestobjects, :as => SIF_RequestObjects
        xml_accessor :respondobjects, :as => SIF_RespondObjects
      end

      class SIF_Message
        include ROXML
        xml_name 'SIF_Message'
        xml_accessor :version, :from => '@Version'
        xml_accessor :xmlns,   :from => '@xmlns'
        xml_accessor :provision, :as => SIF_Provision
      end
        
    end
  end
end
  