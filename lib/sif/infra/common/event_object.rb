require 'active_support/inflector'
module SIF
  module Infra
    module Common
      class EventObject
        include Virtus.model

        attribute :object_name, String
        attribute :action,      String
        attribute :school_course_info,
          SIF::Model::Group::SIS::SchoolCourseInfo
        attribute :school_info,
          SIF::Model::Group::SIS::SchoolInfo
        attribute :staff_personal,
          SIF::Model::Group::SIS::StaffPersonal
        attribute :student_personal,
          SIF::Model::Group::SIS::StudentPersonal
        attribute :student_section_enrollment,
          SIF::Model::Group::SIS::StudentSectionEnrollment
        attribute :term_info,
          SIF::Model::Group::SIS::TermInfo
        attribute :section_info,
          SIF::Model::Group::SIS::SectionInfo
        attribute :grading_assignment,
          SIF::Model::Group::Grades::GradingAssignment
        attribute :grading_assignment_score,
          SIF::Model::Group::Grades::GradingAssignmentScore
        attribute :grading_category,
          SIF::Model::Group::Grades::GradingCategory
        def object
          school_course_info ||
          school_info ||
          staff_personal ||
          student_personal ||
          student_section_enrollment ||
          term_info ||
          section_info || 
          grading_assignment || 
          grading_assignment_score || 
          grading_category
        end

        def object=(obj)
          attr_name = obj.class.to_s.split('::').last.underscore
          self.send("#{attr_name}=", obj)
        end

        def datatype
          object_name.underscore.to_sym
        end
      end
    end
  end
end