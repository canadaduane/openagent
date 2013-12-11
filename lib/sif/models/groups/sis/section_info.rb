require_relative 'sis_representer'

module SIF
  module Model
    module Group
      module SIS
        class SectionInfo
          include Virtus.model
          include SISRepresenter

          attribute :school_course_info_ref_id, String
          attribute :school_year, String
          attribute :local_id, String
          attribute :description, String
          attribute :schedule_infos, Array[Common::ScheduleInfo]
          attribute :medium_of_instruction, String
          attribute :language_of_instruction, String
          attribute :location_of_instruction, String
          attribute :summer_school, String
          attribute :school_course_info_override, Common::SchoolCourseInfoOverride

          def schedule_info_for_term(term_info_ref_id)
            schedule_infos.find do |si|
              si.term_info_ref_id == term_info_ref_id
            end || Common::ScheduleInfo.new
          end

          def first_schedule_info
            schedule_infos.first || Common::ScheduleInfo.new
          end

          def term_info_ref_id
            first_schedule_info.term_info_ref_id
          end

          def teacher
            first_schedule_info.first_teacher
          end
        end
      end
    end
  end
end