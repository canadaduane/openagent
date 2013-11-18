require_relative 'sis_representer'

module SIF
  module Representation
    module Model
      module Group
        module SIS
          class SchoolCourseInfo < SIF::Represent
            include SISRepresenter
            
            self.representation_wrap = 'SchoolCourseInfo'

            property :school_info_id, :attribute => true, :as => 'SchoolInfoId'
            property :school_year, :attribute => true, :as => 'SchoolYear'
            property :course_code, :as => 'CourseCode'
            property :state_course_code, :as => 'StateCourseCode'
            property :district_course_code, :as => 'DistrictCourseCode'
            collection :subject_areas, :as =>'SubjectArea', :wrap => 'SubjectAreaList',
                       :class => MODEL_COMMON::SubjectArea,
                       :decorator => REPR_COMMON::SubjectArea
            property :course_title, :as => 'CourseTitle'
            property :description, :as => 'Description'
            property :instruction_level, :as => 'InstructionLevel'
            property :course_credits, :as => 'CourseCredits'
            property :core_academic_course, :as => 'CoreAcademicCourse'
            property :graduation_requirement, :as => 'GraduationRequirement'
            property :department, :as => 'Department'
            property :sced_code, :as => 'SCEDCode',
                     :class => MODEL_COMMON::SCEDCode,
                     :decorator => REPR_COMMON::SCEDCode
          end
        end
      end
    end
  end
end
