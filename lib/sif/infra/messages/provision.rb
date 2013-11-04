module SIF
  module Infra
    module Message
      class Provision
        include Virtus.model

        attribute :header,                 Header
        attribute :provide_objects,        Array[Object]
        attribute :subscribe_objects,      Array[Object]
        attribute :publish_add_objects,    Array[Object]
        attribute :publish_change_objects, Array[Object]
        attribute :publish_delete_objects, Array[Object]
        attribute :request_objects,        Array[Object]
        attribute :respond_objects,        Array[Object]
      end
    end
  end
end