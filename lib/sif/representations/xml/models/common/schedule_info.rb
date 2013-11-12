module SIF
  module Representation
    module XML
      module Model
        module Common
          class ScheduleInfo < Representable::Decorator
            require_relative 'meeting_time'

            include Representable::XML

            self.representation_wrap = 'ScheduleInfo'

            property :term_info_ref_id, :as => 'TermInfoRefId', :attribute => true
            collection :teachers, :as => 'StaffPersonalRefId', :wrap => 'TeacherList'
            collection :section_rooms, :as => 'RoomInfoRefId', :wrap => 'SectionRoomList'
            collection :meeting_times, :as => 'MeetingTime', :wrap => 'MeetingTimeList',
                       :class => MODEL_COMMON::MeetingTime,
                       :decorator => XML_COMMON::MeetingTime
          end
        end
      end
    end
  end
end