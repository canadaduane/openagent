module SIF
  module Model
    module Common
      class CreditsAttempted
        include Virtus.model

        attribute :type
        attribute :value, Float
      end
    end
  end
end