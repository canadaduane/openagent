module SIF
  module Infra
    module Common
      class EventObject
        include Virtus.model

        attribute :object_name, String
        attribute :action,      String
        attribute :school_course_infos,
          SIF::Model::Group::SIS::SchoolCourseInfo
        attribute :school_infos,
          SIF::Model::Group::SIS::SchoolInfo
        attribute :staff_personals,
          SIF::Model::Group::SIS::StaffPersonal
        attribute :student_personals,
          SIF::Model::Group::SIS::StudentPersonal
        attribute :student_section_enrollments,
          SIF::Model::Group::SIS::StudentSectionEnrollment
        attribute :term_infos,
          SIF::Model::Group::SIS::TermInfo
        attribute :section_infos,
          SIF::Model::Group::SIS::SectionInfo
        
        def objects
          school_course_infos +
          school_infos +
          staff_personals +
          student_personals +
          student_section_enrollments +
          term_infos +
          section_infos
        end

        def datatype
          return :school_course_info unless school_course_infos.empty?
          return :school_info        unless school_infos.empty?
          return :staff_personal     unless staff_personals.empty?
          return :student_personal   unless student_personals.empty?
          return :student_section_enrollment unless student_section_enrollments.empty?
          return :term_info          unless term_infos.empty?
          return :section_info       unless section_infos.empty?
        end
      end
    end
  end
end