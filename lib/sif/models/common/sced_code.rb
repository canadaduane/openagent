module SIF
  module Model
    module Common
      class SCEDCode
        include Virtus.model

        attribute :course_description, String
        attribute :course_level, String
        attribute :available_credit, Float
        attribute :sequence_number, Integer
        attribute :sequence_limit, Integer
      end
    end
  end
end