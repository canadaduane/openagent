module SIF
  module Representation
    module Model
      module Group
        module Grades
          class GradingCategory < SIF::Represent
            
            self.representation_wrap = 'GradingCategory'

            property :ref_id, :attribute => true, :as => 'RefId'
            property :section_info_ref_id, :attribute =>true, :as => 'SectionInfoRefId'
            property :term_info_ref_id, :attribute =>true, :as => 'TermInfoRefId'
            property :school_info_ref_id, :attribute =>true, :as => 'SchoolInfoRefId'
            property :description, :as => 'Description'
            property :metadata, :as => 'Metadata'
            collection :extended_elements, :as => 'SIF_ExtendedElement', :wrap => 'SIF_ExtendedElements',
                     :class => MODEL_COMMON::ExtendedElement,
                     :decorator => REPR_COMMON::ExtendedElement
          end
        end
      end
    end
  end
end