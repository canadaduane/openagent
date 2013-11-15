require_relative 'object'

module SIF
  module Representation
    module Infra
      module Common
        class Provision < SIF::Represent
          self.representation_wrap = 'SIF_Provision'

          property :header, :as => 'SIF_Header',
                    :class => SIF::Infra::Common::Header,
                    :decorator => SIF::Representation::Infra::Common::Header
          collection :provide_objects, :as => 'SIF_ProvideObjects',
                    :class => SIF::Infra::Common::Object,
                    :decorator => SIF::Representation::Infra::Common::Object
          collection :subscribe_objects, :as => 'SIF_SubscribeObjects',
                    :class => SIF::Infra::Common::Object,
                    :decorator => SIF::Representation::Infra::Common::Object
          collection :publish_add_objects, :as => 'SIF_PublishAddObjects',
                    :class => SIF::Infra::Common::Object,
                    :decorator => SIF::Representation::Infra::Common::Object
          collection :publish_change_objects, :as => 'SIF_PublishChangeObjects',
                    :class => SIF::Infra::Common::Object,
                    :decorator => SIF::Representation::Infra::Common::Object
          collection :publish_delete_objects, :as => 'SIF_PublishDeleteObjects',
                    :class => SIF::Infra::Common::Object,
                    :decorator => SIF::Representation::Infra::Common::Object
          collection :request_objects, :as => 'SIF_RequestObjects',
                    :class => SIF::Infra::Common::Object,
                    :decorator => SIF::Representation::Infra::Common::Object
          collection :respond_objects, :as => 'SIF_RespondObjects',
                    :class => SIF::Infra::Common::Object,
                    :decorator => SIF::Representation::Infra::Common::Object
        end
      end
    end
  end
end
