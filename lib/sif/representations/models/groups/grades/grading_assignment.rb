module SIF
  module Representation
    module Model
      module Group
        module Grades
          class GradingAssignment < SIF::Represent
            
            self.representation_wrap = 'GradingAssignment'

            property :ref_id, :attribute => true, :as => 'RefId'
            property :section_info_ref_id, :attribute =>true, :as => 'SectionInfoRefId'
            property :term_info_ref_id, :attribute =>true, :as => 'TermInfoRefId'
            property :school_info_ref_id, :attribute =>true, :as => 'SchoolInfoRefId'
            property :grading_category_ref_id, :attribute =>true, :as => 'GradingCategoryRefId'
            property :description, :attribute => true, :as => 'Description'
            property :points_possible, :attribute => true, :as => 'PointsPossible'
            property :create_date, :as => 'CreateDate'
            property :due_date, :as => 'DueDate'
            property :weight, :as => 'Weight'
            property :detailed_description, :as => 'DetailDescription'
            collection :extended_elements, :as => 'SIF_ExtendedElement', :wrap => 'SIF_ExtendedElements',
                     :class => MODEL_COMMON::ExtendedElement,
                     :decorator => REPR_COMMON::ExtendedElement
          end
        end
      end
    end
  end
end