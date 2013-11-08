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

        def message
          ack || event || provide || provision ||
          register || request || response || subscribe ||
          system_control || unprovide || unregister || unsubscribe
        end

        def msg_id
          message && message.header.msg_id
        end
      end
    end
  end
end