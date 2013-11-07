module SIF
  module Representation
    module XML
      module Infra
        module Message
          class Provision < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_Provision'

            property :header, :as => :SIF_Header,
                     :class => SIF::Infra::Common::Header,
                     :decorator => XML::Infra::Common::Header
            collection :provide_objects, :as => :SIF_Object, :wrap => :SIF_ProvideObjects,
                       :class => SIF::Infra::Common::Object,
                       :decorator => XML::Infra::Common::Object
            collection :subscribe_objects, :as => :SIF_Object, :wrap => :SIF_SubscribeObjects,
                       :class => SIF::Infra::Common::Object,
                       :decorator => XML::Infra::Common::Object
            collection :publish_add_objects, :as => :SIF_Object, :wrap => :SIF_PublishAddObjects,
                       :class => SIF::Infra::Common::Object,
                       :decorator => XML::Infra::Common::Object
            collection :publish_change_objects, :as => :SIF_Object, :wrap => :SIF_PublishChangeObjects,
                       :class => SIF::Infra::Common::Object,
                       :decorator => XML::Infra::Common::Object
            collection :publish_delete_objects, :as => :SIF_Object, :wrap => :SIF_PublishDeleteObjects,
                       :class => SIF::Infra::Common::Object,
                       :decorator => XML::Infra::Common::Object
            collection :request_objects, :as => :SIF_Object, :wrap => :SIF_RequestObjects,
                       :class => SIF::Infra::Common::Object,
                       :decorator => XML::Infra::Common::Object
            collection :respond_objects, :as => :SIF_Object, :wrap => :SIF_RespondObjects,
                       :class => SIF::Infra::Common::Object,
                       :decorator => XML::Infra::Common::Object
          end
        end
      end
    end
  end
end
