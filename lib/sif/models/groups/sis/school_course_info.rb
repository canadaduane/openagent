require_relative 'sis_representer'

module SIF
  module Model
    module Group
      module SIS
        class SchoolCourseInfo
          include Virtus.model

          attribute :school_info_id, String
          attribute :school_year, String
          attribute :course_code, String
          attribute :state_course_code, String
          attribute :district_course_code, String
          attribute :subject_areas, Array[Common::SubjectArea]
          attribute :course_title, String
          attribute :description, String
          attribute :instruction_level, String
          attribute :course_credits, String
          attribute :core_academic_course, String
          attribute :graduation_requirement, String
          attribute :department, String
          attribute :sced_code, Common::SCEDCode

        end
      end
    end
  end
end