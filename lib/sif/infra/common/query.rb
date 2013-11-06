require_relative 'query_object'
require_relative 'condition_group'

module SIF
  module Infra
    module Common
      class Query
        include Virtus.model

        attribute :query_object,    QueryObject
        attribute :condition_group, ConditionGroup
        attribute :example
      end
    end
  end
end