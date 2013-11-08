module SIF
  module Representation
    module XML
      module Model
        module Group
          module SIS
            class StudentSectionEnrollment < Representable::Decorator
              include Representable::XML
              include SISRepresenter
              self.representation_wrap = 'StudentSectionEnrollment'

              property :student_personal_ref_id, :attribute => true, :as => 'StudentPersonalRefId'
              property :section_info_ref_id, :attribute =>true, :as => 'SectionInfoRefId'
              property :school_year, :attribute => true, :as => 'SchoolYear'
              property :entry_date, :as => 'EntryDate'
              property :exit_date, :as => 'ExitDate'
              property :schedule_info_overrides, :as => 'ScheduleInfoOverrideList',
                       :class => SIF_MODEL::ScheduleInfoOverride,
                       :decorator => SIF_XML::ScheduleInfoOverride
              property :credits_attempted, :as => 'CreditsAttempted',
                       :class => SIF_MODEL::CreditsAttempted,
                       :class => SIF_XML::CreditsAttempted
            end
          end
        end
      end
    end
  end
end