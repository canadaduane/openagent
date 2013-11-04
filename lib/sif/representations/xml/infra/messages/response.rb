module SIF
  module Representation
    module XML
      module Infra
        module Message
          class Response < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_Response'

            property :header, :as => 'SIF_Header',
                     :class => SIF::Infra::Message::Header,
                     :decorator => Header
            property :error,  :as => 'SIF_Error',
                     :class => SIF::Infra::Message::Error,
                     :decorator => Error
            property :object_data, :as => 'SIF_ObjectData',
                     :class => SIF::Infra::Message::ObjectData,
                     :decorator => ObjectData
            property :extended_query_results, :as => 'SIF_ExtendedQueryResults',
                     :class => SIF::Infra::Message::ExtendedQueryResults,
                     :decorator => ExtendedQueryResults

            property :request_msg_id, :as => 'SIF_RequestMsgId'
            property :packet_number,  :as => 'SIF_PacketNumber'
            property :more_packets, :as => 'SIF_MorePackets'
          end
        end
      end
    end
  end
end
