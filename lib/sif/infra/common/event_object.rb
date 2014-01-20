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
        
        def object
          school_course_infos ||
          school_infos ||
          staff_personals ||
          student_personals ||
          student_section_enrollments ||
          term_infos ||
          section_infos
        end

        def datatype
          object_name.underscore.to_sym
        end
      end
    end
  end
end