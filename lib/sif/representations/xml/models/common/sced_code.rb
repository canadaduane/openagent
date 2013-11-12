module SIF
  module Representation
    module XML
      module Model
        module Common
          class SCEDCode < Representable::Decorator
            include Representable::XML

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
end