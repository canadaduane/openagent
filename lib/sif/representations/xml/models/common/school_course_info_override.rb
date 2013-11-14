module SIF
  module Representation
    module XML
      module Model
        module Common
          class SchoolCourseInfoOverride < SIF::Representation

            self.representation_wrap = 'SchoolCourseInfoOverride'

            property :override, :as => 'Override', :attribute => true
            property :course_code, :as => 'CourseCode'
            property :state_courase_code, :as => 'StateCourseCode'
            property :district_course_code, :as => 'DistrictCourseCode'
            property :subject_area, :as => 'SubjectArea'
            property :course_title, :as => 'CourseTitle'
            property :instruction_level, :as => 'InstructionLevel'
            property :course_credits, :as => 'CourseCredits'
          end
        end
      end
    end
  end
end