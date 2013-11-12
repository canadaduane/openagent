module SIF
  module Model
    module Common
      class PhoneNumber
        include Virtus.model

        attribute :type, String
        attribute :action, String
        attribute :number, String
        attribute :extension, String
        attribute :listed_status, String
      end
    end
  end
end