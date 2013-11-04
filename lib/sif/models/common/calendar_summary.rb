require 'date'

module SIF
  module Model
    module Common
      class CalendarSummary
        include Virtus.model

        attribute :date, Date
        attribute :school_info_ref_id, String
        attribute :school_year, Integer
        attribute :local_id, String
        attribute :description, String
        attribute :days_in_session, Integer
        attribute :start_date, Date
        attribute :end_date, Date
        attribute :first_instruction_date, Date
        attribute :last_instruction_date, Date
        attribute :graduation_date, Date
        attribute :instructional_minutes, Integer
        attribute :minutes_per_day, Integer
        attribute :grade_levels
        attribute :metadata
        attribute :extended_elements
      end
    end
  end
end