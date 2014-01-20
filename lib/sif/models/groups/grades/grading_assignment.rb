module SIF
  module Model
    module Group
      module Grades
        class GradingAssignment
          include Virtus.model

          attribute :ref_id,                  String
          attribute :section_info_ref_id,     String
          attribute :school_info_ref_id,      String
          attribute :term_info_ref_id,        String
          attribute :grading_category_ref_id, String
          attribute :description,             String
          attribute :points_possible,         String
          attribute :create_date,             Date
          attribute :weight,                  String
          attribute :detailed_description,    String
          attribute :due_date,                Date
          attribute :metadata,                String
          attribute :extended_elements, Array[MODEL_COMMON::ExtendedElement]
          
        end
      end
    end
  end
end