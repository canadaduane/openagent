module SIF
  module Message
    class Request
      include Virtus.model

      attribute :header,          Header
      attribute :query,           Query
      attribute :extended_query,  ExtendedQuery

      attribute :version,         String
      attribute :max_buffer_size, Integer
    end
  end
end
