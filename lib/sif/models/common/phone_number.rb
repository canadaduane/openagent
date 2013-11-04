module SIF
  module Model
    module Common
      class PhoneNumber
        include Virtus.model

        attribute :action, String
        attribute :phone_number, String
      end
    end
  end
end