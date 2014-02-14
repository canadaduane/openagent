module SIF
  module Model
    module Group
      module SIS
        class StudentSectionEnrollment
          include Virtus.model
          include SISRepresenter

          attribute :student_personal_ref_id, String
          attribute :section_info_ref_id, String
          attribute :school_year, String
          attribute :entry_date, Date
          attribute :exit_date, Date
          attribute :schedule_info_overrides, Array[Common::ScheduleInfoOverride]
          attribute :credits_attempted, Common::CreditsAttempted
          
          def status(as_of = Date.today)
            return (exit_date && as_of > exit_date) ? 'deleted' : 'active'
          end
        end
      end
    end
  end
end