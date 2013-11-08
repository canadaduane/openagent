module SIF
  module Representation
    module XML
      module Model
        module Group
          module SIS
            class SectionInfo < Representable::Decorator
              include Representable::XML
              include SISRepresenter
              self.representation_wrap = 'SectionInfo'

              property :school_course_info, :attribute => true, :as => 'SchoolCourseInfoRefId'
              property :school_year, :attribute => true, :as => 'SchoolYear'
              property :local_id, :as => 'LocalId'
              property :description, :as => 'Description'
              collection :schedule_infos, :as => 'ScheduleInfoList',
                         :class => SIF_MODEL::ScheduleInfoList,
                         :decorator => SIF_XML::ScheduleInfoList
              property :medium_of_instruction, :as => 'MediumOfInstruction',
                       :class => SIF_MODEL::MediumOfInstruction,
                       :decorator => SIF_XML::MediumOfInstruction
              property :language_of_instruction, :as => 'LanguageOfInstruction',
                       :class => SIF_MODEL::LanguageOfInstruction,
                       :decorator => SIF_XML::LanguageOfInstruction
              property :location_of_instruction, :as => 'LocationOfInstruction',
                       :class => SIF_MODEL::LocationOfInstruction,
                       :decorator => SIF_XML::LocationOfInstruction
              property :summer_school, :as => 'SummerSchool'
              property :school_course_info_override, :as => 'SchoolCourseInfoOverride',
                       :class => SIF_MODEL::SchoolCourseInfoOverride,
                       :decorator => SIF_XML::SchoolCourseInfoOverride
            end
          end
        end
      end
    end
  end
end