module SIF
  module Infra
    module Common
      class ObjectData
        include Virtus.model

        attribute :event_object,        Common::EventObject

        attribute :lea_infos,           Array[SIF::Model::Group::SIS::LEAInfo]
        attribute :school_course_infos, Array[SIF::Model::Group::SIS::SchoolCourseInfo]
        attribute :school_infos,        Array[SIF::Model::Group::SIS::SchoolInfo]
        attribute :staff_personals,     Array[SIF::Model::Group::SIS::StaffPersonal]
        attribute :student_personals,   Array[SIF::Model::Group::SIS::StudentPersonal]
        attribute :student_section_enrollments, Array[SIF::Model::Group::SIS::StudentSectionEnrollment]
        attribute :term_infos,          Array[SIF::Model::Group::SIS::TermInfo]

        def objects
          lea_infos || school_course_infos || school_infos ||
          staff_personals || student_personals ||
          student_section_enrollments || term_infos
        end
      end
    end
  end
end