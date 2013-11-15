module SIF
  module Model
    module Common
      class ScheduleInfo
        include Virtus.model

        attribute :term_info_ref_id
        attribute :teachers, Array[String]
        attribute :section_rooms, Array[String]
        attribute :meeting_times, Array[MODEL_COMMON::MeetingTime]
      end
    end
  end
end