module SIF
  module Model
    module Group
      module Grades
        class GradingAssignmentScore
          include Virtus.model

          attribute :student_personal_ref_id,   String
          attribute :section_info_ref_id,       String
          attribute :school_info_ref_id,        String
          attribute :grading_assignment_ref_id, String
          attribute :score_points,              String
          attribute :score_percent,             String
          attribute :score_letter,              String
          attribute :score_description,         String
          attribute :metadata,                  String
          attribute :extended_elements, Array[MODEL_COMMON::ExtendedElement]
          
        end
      end
    end
  end
end