module SIF
  module Model
    module Common
      class Code
        include Virtus.model

        attribute :code, Integer
        attribute :other_codes, Array[String]
      end
    end
  end
end