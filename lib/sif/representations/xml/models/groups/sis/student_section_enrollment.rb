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
              property :schedule_info_overrides, :as => 'ScheduleInfoOverride', :wrap => 'ScheduleInfoOverrideList',
                       :class => MODEL_COMMON::ScheduleInfoOverride,
                       :decorator => XML_COMMON::ScheduleInfoOverride
              property :credits_attempted, :as => 'CreditsAttempted',
                       :class => MODEL_COMMON::CreditsAttempted,
                       :class => XML_COMMON::CreditsAttempted
            end
          end
        end
      end
    end
  end
end