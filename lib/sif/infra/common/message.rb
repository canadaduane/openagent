module SIF
  module Infra
    module Common
      class Message
        include Virtus.model

        attribute :xmlns,          String
        attribute :version,        String

        attribute :ack
        attribute :event
        attribute :provide
        attribute :provision
        attribute :register
        attribute :request
        attribute :response
        attribute :subscribe
        attribute :system_control
        attribute :unprovide
        attribute :unregister
        attribute :unsubscribe
      end
    end
  end
end