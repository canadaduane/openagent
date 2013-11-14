module SIF
  module Representation
    module XML
      module Model
        module Common
          class MeetingTime < SIF::Representation

            self.representation_wrap = 'MeetingTime'

            property :timetable_day, :as => 'TimetableDay'
            property :timetable_period, :as => 'TimetablePeriod'

          end
        end
      end
    end
  end
end