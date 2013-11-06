module SIF
  module Representation
    module XML
      module Model
        module Group
          module SIS
            class SchoolCourseInfo < Representable::Decorator
              include Representable::XML

              self.representation_wrap = 'SchoolCourseInfo'

              property :ref_id, :attribute => true, :as => "RefId"
              "SchoolInfoId"
              "Schoolyear"
              "CourseCode"
              "StateCourseCode"
              "DistrictCourseCode"
              "SubjectAreaList"
              "CourseTitle"
              "Description"
              "InstructionLevel"
              "CourseCredits"
              "CoreAcademicCourse"
              "GraduationRequirement"
              "Department"
              "SCEDCode"
              property :metadata => "SIF_Metadata"
              property :extended_elements => "SIF_ExtendedElements"
            end
          end
        end
      end
    end
  end
end
