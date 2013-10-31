module SIF
  module Message
    class QueryObject
      include Virtus.model

      attribute :object_name, String
      attribute :element,     String
    end
  end
end
