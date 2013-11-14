module SIF
  module Representation
    module XML
      module Model
        module Group
          module SIS
            class SectionInfo < SIF::Represent
              include SISRepresenter
              self.representation_wrap = 'SectionInfo'

              property :school_course_info, :attribute => true, :as => 'SchoolCourseInfoRefId'
              property :school_year, :attribute => true, :as => 'SchoolYear'
              property :local_id, :as => 'LocalId'
              property :description, :as => 'Description'
              collection :schedule_infos, :as => 'ScheduleInfo', :wrap => 'ScheduleInfoList',
                         :class => MODEL_COMMON::ScheduleInfo,
                         :decorator => XML_COMMON::ScheduleInfo
              property :medium_of_instruction, :as => 'MediumOfInstruction'
              property :language_of_instruction, :as => 'LanguageOfInstruction'
              property :location_of_instruction, :as => 'LocationOfInstruction'
              property :summer_school, :as => 'SummerSchool'
              property :school_course_info_override, :as => 'SchoolCourseInfoOverride',
                       :class => MODEL_COMMON::SchoolCourseInfoOverride,
                       :decorator => XML_COMMON::SchoolCourseInfoOverride
            end
          end
        end
      end
    end
  end
end