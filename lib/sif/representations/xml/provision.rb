module SIF
  module Representation
    module XML
      class Provision < Representable::Decorator
        include Representable::XML

        self.representation_wrap = 'SIF_Provision'

        property :header, :as => :SIF_Header,
                 :class => SIF::Message::Header, :decorator => XML::Header
        collection :provide_objects, :as => :SIF_Object, :wrap => :SIF_ProvideObjects,
                   :class => SIF::Message::Object, :decorator => XML::Object
        collection :subscribe_objects, :as => :SIF_Object, :wrap => :SIF_SubscribeObjects,
                   :class => SIF::Message::Object, :decorator => XML::Object
        collection :publish_add_objects, :as => :SIF_Object, :wrap => :SIF_PublishAddObjects,
                   :class => SIF::Message::Object, :decorator => XML::Object
        collection :publish_change_objects, :as => :SIF_Object, :wrap => :SIF_PublishChangeObjects,
                   :class => SIF::Message::Object, :decorator => XML::Object
        collection :publish_delete_objects, :as => :SIF_Object, :wrap => :SIF_PublishDeleteObjects,
                   :class => SIF::Message::Object, :decorator => XML::Object
        collection :request_objects, :as => :SIF_Object, :wrap => :SIF_RequestObjects,
                   :class => SIF::Message::Object, :decorator => XML::Object
        collection :respond_objects, :as => :SIF_Object, :wrap => :SIF_RespondObjects,
                   :class => SIF::Message::Object, :decorator => XML::Object
      end
    end
  end
end