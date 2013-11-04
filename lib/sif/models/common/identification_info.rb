module SIF
  module Model
    module Common
      class IdentificationInfo
        include Virtus.model

        attribute :code, String
        attribute :value, String
      end
    end
  end
end