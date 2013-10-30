module SIF
  module Model
    class QueryObject
      include Virtus.model

      attribute :object_name, String
      attribute :element,     String
    end
  end
end
