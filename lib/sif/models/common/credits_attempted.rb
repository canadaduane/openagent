module SIF
  module Model
    module Common
      class CreditsAttempted
        include Virtus.model

        attribute :type
        attribute :value
      end
    end
  end
end