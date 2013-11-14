require 'date'

module SIF
  module Model
    module Group
      module SIS
        class CalendarDate
          include Virtus.model

          attribute :date, Date
          attribute :calendar_summary_ref_id, String
          attribute :school_info_ref_id, String
          attribute :school_year, Integer
          attribute :calendar_date_type, String
          attribute :calendar_date_number, Integer
          attribute :student_attendance
          attribute :teacher_attendance
          attribute :administrator_attendance
          attribute :metadata
          attribute :extended_elements
        end
      end
    end
  end
end