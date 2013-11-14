module SIF
  module Model
    module Group
      module SIS
        class StudentSectionEnrollment
          include Virtus.model

          attribute :student_personal_ref_id, String
          attribute :section_info_ref_id, String
          attribute :school_year, String
          attribute :entry_date, Date
          attribute :exit_date, Date
          attribute :schedule_info_overrides, Common::ScheduleInfoOverride
          attribute :credits_attempted, Common::CreditsAttempted
          
        end
      end
    end
  end
end