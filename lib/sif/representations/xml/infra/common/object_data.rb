require_relative 'event_object'

module SIF
  module Representation
    module XML
      module Infra
        module Common
          class ObjectData < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_ObjectData'

            property :event_object, :as => 'SIF_EventObject',
                     :class => SIF::Infra::Common::EventObject,
                     :decorator => EventObject

            # collection :lea_infos, :as => 'LEAInfo',
            #            :class => SIF::Model::Group::SIS::LEAInfo,
            #            :decorator => XML::Model::Group::SIS::LEAInfo
            collection :school_course_infos, :as => 'SchoolCourseInfo',
                       :class => SIF::Model::Group::SIS::SchoolCourseInfo,
                       :decorator => XML::Model::Group::SIS::SchoolCourseInfo
            collection :school_infos, :as => 'SchoolInfo',
                       :class => SIF::Model::Group::SIS::SchoolInfo,
                       :decorator => XML::Model::Group::SIS::SchoolInfo
            collection :staff_personals, :as => 'StaffPersonal',
                       :class => SIF::Model::Group::SIS::StaffPersonal,
                       :decorator => XML::Model::Group::SIS::StaffPersonal
            collection :student_personals, :as => 'StudentPersonal',
                       :class => SIF::Model::Group::SIS::StudentPersonal,
                       :decorator => XML::Model::Group::SIS::StudentPersonal
            collection :student_section_enrollments, :as => 'StudentSectionEnrollment',
                       :class => SIF::Model::Group::SIS::StudentSectionEnrollment,
                       :decorator => XML::Model::Group::SIS::StudentSectionEnrollment
            collection :term_infos, :as => 'TermInfo',
                       :class => SIF::Model::Group::SIS::TermInfo,
                       :decorator => XML::Model::Group::SIS::TermInfo
          end
        end
      end
    end
  end
end