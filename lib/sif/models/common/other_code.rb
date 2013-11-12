module SIF
  module Model
    module Common
      class OtherCode
        include Virtus.model

        attribute :value, String
        attribute :code_set, String
      end
    end
  end
end