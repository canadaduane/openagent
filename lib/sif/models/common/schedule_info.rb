module SIF
  module Model
    module Common
      class ScheduleInfo
        include Virtus.model

        attribute :term_info_ref_id
        attribute :teachers, Array[String]
        attribute :sections, Array[String]
        attribute :meeting_times, Array[String]
      end
    end
  end
end