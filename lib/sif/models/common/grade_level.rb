module SIF
  module Model
    module Common
      class GradeLevel
        include Virtus.model

        attribute :code, String
        attribute :other_codes, Array[String]
      end
    end
  end
end