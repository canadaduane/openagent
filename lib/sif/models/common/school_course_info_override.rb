module SIF
  module Model
    module Common
      class SchoolCourseInfoOverride
        include Virtus.model

        attribute :override
        attribute :course_code
        attribute :state_course_code
        attribute :district_course_code
        attribute :subject_area
        attribute :course_title
        attribute :instruction_level
        attribute :course_credits
      end
    end
  end
end