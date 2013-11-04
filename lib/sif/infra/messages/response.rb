module SIF
  module Infra
    module Message
      class Response
        include Virtus.model

        attribute :header, Header
        attribute :error, Error
        attribute :object_data, ObjectData
        attribute :extended_query_results, ExtendedQueryResults

        attribute :request_msg_id, String
        attribute :packet_number,  Integer
        attribute :more_packets,   Boolean
      end
    end
  end
end