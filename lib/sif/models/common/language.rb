module SIF
  module Model
    module Common
      class Language
        include Virtus.model

        attribute :code, String
        attribute :language_type
        attribute :dialect
        attribute :other_codes, Array[String]
      end
    end
  end
end