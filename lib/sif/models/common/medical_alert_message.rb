module SIF
  module Model
    module Common
      class MedicalAlertMessage
        include Virtus.model

        attribute :type, String
        attribute :value, String
      end
    end
  end
end