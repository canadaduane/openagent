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

        def inner_message
          ack.status.data.message
        rescue NoMethodError
          nil
        end

        def response_objects
          inner_message.response.object_data.objects
        rescue NoMethodError
          nil
        end

        def type
          if event then :event else :response end
        end

        def content
          ack || event || provide || provision ||
          register || request || response || subscribe ||
          system_control || unprovide || unregister || unsubscribe
        end

        def msg_id
          content && content.header.msg_id
        end
      end
    end
  end
end