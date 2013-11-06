module SIF
  module Infra
    module Message
      class Response
        include Virtus.model

        attribute :header,      Common::Header
        attribute :error,       Common::Error
        attribute :object_data, Common::ObjectData
        attribute :extended_query_results, Common::ExtendedQueryResults

        attribute :request_msg_id, String
        attribute :packet_number,  Integer
        attribute :more_packets,   Boolean
      end
    end
  end
end