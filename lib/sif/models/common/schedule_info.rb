module SIF
  module Model
    module Common
      class ScheduleInfo
        include Virtus.model

        attribute :term_info_ref_id
        attribute :teachers, Array[String], :default => []
        attribute :section_rooms, Array[String], :default => []
        attribute :meeting_times, Array[Common::MeetingTime], :default => []

        def first_meeting_time
          meeting_times.first || Common::MeetingTime.new
        end

        def first_teacher
          teachers.first || String.new
        end
      end
    end
  end
end