module SIF
  module Representation
    module Model
      module Common
        class MeetingTime < SIF::Represent

          self.representation_wrap = 'MeetingTime'

          property :timetable_day, :as => 'TimetableDay'
          property :timetable_period, :as => 'TimetablePeriod'

        end
      end
    end
  end
end
