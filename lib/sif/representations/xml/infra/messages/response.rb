module SIF
  module Representation
    module XML
      class Response < Representable::Decorator
        include Representable::XML

        self.representation_wrap = 'SIF_Response'

        property :header, :as => 'SIF_Header',
                 :class => SIF::Message::Header, :decorator => XML::Header
        property :error,  :as => 'SIF_Error',
                 :class => SIF::Message::Error,  :decorator => XML::Error
        property :object_data, :as => 'SIF_ObjectData',
                 :class => SIF::Message::ObjectData, :decorator => XML::ObjectData
        property :extended_query_results, :as => 'SIF_ExtendedQueryResults',
                 :class => SIF::Message::ExtendedQueryResults, :decorator => XML::ExtendedQueryResults

        property :request_msg_id, :as => 'SIF_RequestMsgId'
        property :packet_number,  :as => 'SIF_PacketNumber'
        property :more_packets, :as => 'SIF_MorePackets'
      end
    end
  end
end