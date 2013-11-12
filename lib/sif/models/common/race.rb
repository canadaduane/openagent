module SIF
  module Model
    module Common
      class Race
        require_relative 'other_code'

        include Virtus.model

        attribute :code, String
        attribute :proportion, Float
        attribute :other_codes, Array[MODEL_COMMON::OtherCode]
      end
    end
  end
end