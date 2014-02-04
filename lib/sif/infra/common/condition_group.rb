require_relative 'conditions'

module SIF
  module Infra
    module Common
      class ConditionGroup
        include Virtus.model
        
        attribute :type,       String
        attribute :conditions, Array[Conditions]

        def empty?
          return true if conditions.nil?
          return true if conditions.empty?
          return false
        end
      end
    end
  end
end