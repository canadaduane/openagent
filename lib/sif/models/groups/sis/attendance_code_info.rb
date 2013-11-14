module SIF
  module Model
    module Group
      module SIS
        class AttendanceCodeInfo
          include Virtus.model

          attribute :ref_id, String
          attribute :school_info_ref_id, String
          attribute :attendance_code, String
          attribute :attendance_type, String
          attribute :attendance_status, String
          attribute :description, String
          attribute :absence_value, Float
          attribute :used_for_daily_attendance, Boolean
          attribute :used_for_period_attendance, Boolean
          attribute :metadata
          attribute :extended_elements
        end
      end
    end
  end
end