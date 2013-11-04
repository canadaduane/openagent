module SIF
  module Model
    module Common
      class ExceptionalityCategory
        include Virtus.model

        attribute :code, String
        attribute :other_codes, Array[String]
        attribute :exceptionality_priority, String
      end
    end
  end
end