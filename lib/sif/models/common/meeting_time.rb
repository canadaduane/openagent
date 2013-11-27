module SIF
  module Model
    module Common
      class MeetingTime
        include Virtus.model

        attribute :timetable_day, String
        alias_method :day, :timetable_day

        attribute :timetable_period, String
        alias_method :period, :timetable_period

        def expression
          "#{period}(#{day})"
        end
      end
    end
  end
end