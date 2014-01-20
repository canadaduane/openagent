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
            property :score_points, :as => 'ScorePoints'
            property :score_percent, :as => 'ScorePercent'
            property :score_letter, :as => 'ScoreLetter'
            property :score_description, :as => 'ScoreDescription'
            property :metadata, :as => 'SIF_Metadata'
            collection :extended_elements, :as => 'SIF_ExtendedElement', :wrap => 'SIF_ExtendedElements',
                     :class => MODEL_COMMON::ExtendedElement,
                     :decorator => REPR_COMMON::ExtendedElement
          end
        end
      end
    end
  end
end