module SIF
  module Representation
    module Model
      module Group
        module Grades
          class GradingAssignmentScore < SIF::Represent
            
            self.representation_wrap = 'GradingAssignmentScore'

            property :student_personal_ref_id, :attribute => true, :as => 'StudentPersonalRefId'
            property :section_info_ref_id, :attribute =>true, :as => 'SectionInfoRefId'
            property :grading_assignment_ref_id, :attribute =>true, :as => 'GradingAssignmentRefId'
            property :school_info_ref_id, :attribute =>true, :as => 'SchoolInfoRefId'
            property :grading_category_info_ref_id, :attribute =>true, :as => 'GradingCategoryInfoRefId'
            property :score_points, :attribute => true, :as => 'ScorePoints'
            property :score_percent, :attribute => true, :as => 'ScorePercent'
            property :score_letter, :attribute => true, :as => 'ScoreLetter'
            property :score_description, :attribute => true, :as => 'ScoreDescription'
            property :metadata, :attribute => true, :as => 'SIF_Metadata'
            collection :extended_elements, :as => 'SIF_ExtendedElement', :wrap => 'SIF_ExtendedElements',
                     :class => MODEL_COMMON::ExtendedElements,
                     :decorator => REPR_COMMON::ExtendedElements
          end
        end
      end
    end
  end
end