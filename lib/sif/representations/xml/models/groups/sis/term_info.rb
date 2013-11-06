module SIF
  module Representation
    module XML
      module Model
        module Group
          module SIS
            class TermInfo < Representable::Decorator
              include Representable::XML

              self.representation_wrap = 'TermInfo'

              property :ref_id, :attribute => true, :as => "RefId"
              "SchoolInfoRefId"
              "SchoolYear"
              "StartDate"
              "EndDate"
              "Description"
              "RelativeDuration"
              "TermCode"
              "Track"
              "TermSpan"
              "MarkingTerm"
              "SchedulingTerm"
              "AttendanceTerm"
              property :metadata => "SIF_Metadata"
              property :extended_elements => "SIF_ExtendedElements"
            end
          end
        end
      end
    end
  end
end