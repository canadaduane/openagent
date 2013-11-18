module SIF
  module Infra
    module Common
      class ObjectData
        include Virtus.model

        attribute :event_object,        Common::EventObject

        # attribute :lea_infos,           Array[SIF::Model::Group::SIS::LEAInfo]
        attribute :school_course_infos,
          Array[SIF::Model::Group::SIS::SchoolCourseInfo], :default => []
        attribute :school_infos,
          Array[SIF::Model::Group::SIS::SchoolInfo], :default => []
        attribute :staff_personals,
          Array[SIF::Model::Group::SIS::StaffPersonal], :default => []
        attribute :student_personals,
          Array[SIF::Model::Group::SIS::StudentPersonal], :default => []
        attribute :student_section_enrollments,
          Array[SIF::Model::Group::SIS::StudentSectionEnrollment], :default => []
        attribute :term_infos,
          Array[SIF::Model::Group::SIS::TermInfo], :default => []
        attribute :section_infos,
                  Array[SIF::Model::Group::SIS::SectionInfo], :default => []
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