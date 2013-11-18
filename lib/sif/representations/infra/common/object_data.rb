require_relative 'event_object'

module SIF
  module Representation
    module Infra
      module Common
        class ObjectData < SIF::Represent

          self.representation_wrap = 'SIF_ObjectData'

          property :event_object, :as => 'SIF_EventObject',
                   :class => SIF::Infra::Common::EventObject,
                   :decorator => EventObject

          # collection :lea_infos, :as => 'LEAInfo',
          #            :class => SIF::Model::Group::SIS::LEAInfo,
          #            :decorator => Model::Group::SIS::LEAInfo
          collection :school_course_infos, :as => 'SchoolCourseInfo',
                     :class => SIF::Model::Group::SIS::SchoolCourseInfo,
                     :decorator => Model::Group::SIS::SchoolCourseInfo
          collection :school_infos, :as => 'SchoolInfo',
                     :class => SIF::Model::Group::SIS::SchoolInfo,
                     :decorator => Model::Group::SIS::SchoolInfo
          collection :staff_personals, :as => 'StaffPersonal',
                     :class => SIF::Model::Group::SIS::StaffPersonal,
                     :decorator => Model::Group::SIS::StaffPersonal
          collection :student_personals, :as => 'StudentPersonal',
                     :class => SIF::Model::Group::SIS::StudentPersonal,
                     :decorator => Model::Group::SIS::StudentPersonal
          collection :student_section_enrollments, :as => 'StudentSectionEnrollment',
                     :class => SIF::Model::Group::SIS::StudentSectionEnrollment,
                     :decorator => Model::Group::SIS::StudentSectionEnrollment
          collection :term_infos, :as => 'TermInfo',
                     :class => SIF::Model::Group::SIS::TermInfo,
                     :decorator => Model::Group::SIS::TermInfo
          collection :section_infos, :as => 'SectionInfo',
                     :class => SIF::Model::Group::SIS::SectionInfo,
                     :decorator => Model::Group::SIS::SectionInfo
        end
      end
    end
  end
end
