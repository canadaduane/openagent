module SIF
  module Model
    module Common
      class Email
        include Virtus.model

        attribute :action, String
        attribute :value, String
      end
    end
  end
end