module SIF
  module Representation
    module Model
      module Common
        class ScheduleInfo < SIF::Represent

          self.representation_wrap = 'ScheduleInfo'

          property :term_info_ref_id, :as => 'TermInfoRefId', :attribute => true
          collection :teachers, :as => 'StaffPersonalRefId', :wrap => 'TeacherList'
          collection :section_rooms, :as => 'RoomInfoRefId', :wrap => 'SectionRoomList'
          collection :meeting_times, :as => 'MeetingTime', :wrap => 'MeetingTimeList',
                     :class => MODEL_COMMON::MeetingTime,
                     :decorator => REPR_COMMON::MeetingTime
        end
      end
    end
  end
end
