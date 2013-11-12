module SIF
  module Infra
    module Common
      class Provision
        include Virtus.model
        attribute :header,                 Common::Header
        attribute :provide_objects,        Array[Common::Object]
        attribute :subscribe_objects,      Array[Common::Object]
        attribute :publish_add_objects,    Array[Common::Object]
        attribute :publish_change_objects, Array[Common::Object]
        attribute :publish_delete_objects, Array[Common::Object]
        attribute :request_objects,        Array[Common::Object]
        attribute :respond_objects,       Array[Common::Object]
      end
    end
  end
end