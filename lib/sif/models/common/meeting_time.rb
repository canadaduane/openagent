module SIF
  module Model
    module Common
      class MeetingTime
        include Virtus.model

        attribute :timetable_day, String
        attribute :timetable_period, String
      end
    end
  end
end