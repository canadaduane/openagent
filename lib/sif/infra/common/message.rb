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

        def response?
          inner_message && !inner_message.response.nil?
        end

        def event?
          inner_message && !inner_message.event.nil?
        end

        def final_packet?
          response? && !inner_message.response.more_packets?
        end

        def request_msg_id
          response? && inner_message.response.request_msg_id
        end

        def response_objects
          inner_message.response.object_data.objects
        rescue NoMethodError
          nil
        end

        def event_object
          inner_message.event.object_data.event_object
        rescue NoMethodError
          nil
        end

        def type
          if event then :event else :response end
        end

        def datatype
          if response? && !response_objects.empty?
            inner_message.response.object_data.datatype
          elsif event? && event_object
            event_object.datatype
          end
        end

        def content
          ack || event || provide || provision ||
          register || request || response || subscribe ||
          system_control || unprovide || unregister || unsubscribe
        end

        def source_id
          content && content.header.source_id
        end

        def msg_id
          content && content.header.msg_id
        end

        def timestamp
          content && content.header.timestamp
        end

        def status_code
          ack && ack.status.code
        end

      end
    end
  end
end