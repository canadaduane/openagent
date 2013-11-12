module SIF
  module Model
    module Common
      class DwellingArrangement
        require_relative 'other_code'

        include Virtus.model

        attribute :code, String
        attribute :other_codes, Array[MODEL_COMMON::OtherCode]
      end
    end
  end
end