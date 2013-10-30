module SIF
  module Model
    class ConditionGroup
      include Virtus.model
      
      attribute :type,       String
      attribute :conditions, Array[Condition]
    end
  end
end
