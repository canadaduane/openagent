require_relative 'condition'

module SIF
  module Infra
    module Common
      class ConditionGroup
        include Virtus.model
        
        attribute :type,       String
        attribute :conditions, Array[Condition]
      end
    end
  end
end