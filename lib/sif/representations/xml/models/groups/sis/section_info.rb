module SIF
  module Representation
    module XML
      module Model
        module Group
          module SIS
            class SectionInfo < Representable::Decorator
              include Representable::XML

              self.representation_wrap = 'SectionInfo'

              property :ref_id, :attribute => true, :as => "RefId"
              "SchoolCourseInfoRefId"
              "SchoolYear"
              "LocalId"
              "Description"
              "ScheduleInfoList"
              "MediumOfInstruction"
              "LanguageOfInstruction"
              "LocationOfInstruction"
              "SummerSchool"
              "SchoolCourseInfoOverride"
              property :metadata => "SIF_Metadata"
              property :extended_elements => "SIF_ExtendedElements"
            end
          end
        end
      end
    end
  end
end