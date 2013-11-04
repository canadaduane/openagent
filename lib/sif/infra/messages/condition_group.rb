module SIF
  module Infra
    module Message
      class ConditionGroup
        include Virtus.model
        
        attribute :type,       String
        attribute :conditions, Array[Condition]
      end
    end
  end
end