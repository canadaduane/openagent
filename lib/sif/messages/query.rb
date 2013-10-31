module SIF
  module Message
    class Query
      include Virtus.model

      attribute :query_object,    QueryObject
      attribute :condition_group, ConditionGroup
      attribute :example
    end
  end
end
