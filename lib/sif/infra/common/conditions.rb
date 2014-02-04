module SIF
  module Infra
    module Common
      class Conditions
        include Virtus.model

        attribute :type,     String
        attribute :condition, Array[Condition]

      end
    end
  end
end