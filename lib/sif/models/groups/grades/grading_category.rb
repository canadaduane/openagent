module SIF
  module Model
    module Group
      module Grades
        class GradingCategory
          include Virtus.model

          attribute :ref_id,                    String
          attribute :section_info_ref_id,       String
          attribute :school_info_ref_id,        String
          attribute :term_info_ref_id,          String
          attribute :description,               String
          attribute :metadata,                  String
          attribute :extended_elements, Array[MODEL_COMMON::ExtendedElement]
          
        end
      end
    end
  end
end