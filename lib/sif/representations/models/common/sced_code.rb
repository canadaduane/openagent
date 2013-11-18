module SIF
  module Representation
    module Model
      module Common
        class SCEDCode < SIF::Represent

          self.representation_wrap = 'SCEDCode'

          property :course_description, :as => 'CourseDescription'
          property :course_level, :as => 'CourseLevel'
          property :available_credit, :as => 'AvailableCredit'
          property :sequence_number, :as => 'SequenceNumber'
          property :sequence_limit, :as => 'SequenceLimit'
        end
      end
    end
  end
end
