module SIF
  module Representation
    module XML
      module Model
        module Common
          class SchoolCourseInfoOverride < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SchoolCourseInfoOverride'

            property :override, :as => 'Override', :attribute => true
            property :course_code, :as => 'CourseCode'
            property :state_course_code, :as => 'StateCourseCode'
            property :district_course_code, :as => 'DistrictCourseCode'
            property :subject_area, :as => 'SubjectArea'
            property :course_title, :as => 'CourseTitle'
            property :instructional_level, :as => 'InstructionalLevel'
            property :course_credits, :as => 'CourseCredits'
          end
        end
      end
    end
  end
end