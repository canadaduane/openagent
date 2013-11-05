module SIF
  module Infra
    module Message
      class Request
        include Virtus.model

        attribute :header,          Common::Header
        attribute :query,           Common::Query
        attribute :extended_query,  Common::ExtendedQuery

        attribute :version,         String
        attribute :max_buffer_size, Integer
      end
    end
  end
end