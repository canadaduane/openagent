require_relative 'sis_representer'

module SIF
  module Model
    module Group
      module SIS
        class SectionInfo
          include Virtus.model
          include SISRepresenter

          attribute :school_course_info, String
          attribute :school_year, String
          attribute :local_id, String
          attribute :description, String
          attribute :schedule_infos, Array[Common::ScheduleInfo]
          attribute :medium_of_instruction, String
          attribute :language_of_instruction, String
          attribute :location_of_instruction, String
          attribute :summer_school, String
          attribute :school_course_info_override, Common::SchoolCourseInfoOverride

        end
      end
    end
  end
end