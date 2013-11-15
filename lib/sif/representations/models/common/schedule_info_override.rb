module SIF
  module Representation
    module Model
      module Common
        class ScheduleInfoOverride < SIF::Represent

          self.representation_wrap = 'ScheduleInfoOverride'

          property :term_info_ref_id, :as => 'TermInfoRefId', :attribute => true
          property :override, :as => 'Override', :attribute => true
          collection :meeting_times, :as => 'MeetingTime', :wrap => 'MeetingTimeList',
                     :class => MODEL_COMMON::MeetingTime,
                     :decorator => REPR_COMMON::MeetingTime
        end
      end
    end
  end
end
