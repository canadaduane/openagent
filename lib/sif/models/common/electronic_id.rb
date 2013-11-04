module SIF
  module Model
    module Common
      class ElectronicId
        include Virtus.model

        attribute :type, String
        attribute :value
      end
    end
  end
end