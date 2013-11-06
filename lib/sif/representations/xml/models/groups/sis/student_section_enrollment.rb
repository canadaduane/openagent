module SIF
  module Representation
    module XML
      module Model
        module Group
          module SIS
            class StudentSectionEnrollment < Representable::Decorator
              include Representable::XML

              self.representation_wrap = 'StudentSectionEnrollment'

              property :ref_id, :attribute => true, :as => "RefId"
              "StudentPersonalRefId"
              "SectionInfoRefId"
              "SchoolYear"
              "EntryDate"
              "ExitDate"
              "ScheduleInfoOverrideList"
              "CreditsAttempted"
              property :metadata => "SIF_Metadata"
              property :extended_elements => "SIF_ExtendedElements"
            end
          end
        end
      end
    end
  end
end