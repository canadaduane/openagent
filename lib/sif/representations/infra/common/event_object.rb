module SIF
  module Representation
    module Infra
      module Common
        class EventObject < SIF::Represent

          self.representation_wrap = 'SIF_EventObject'

          property :object_name, :as => "ObjectName", :attribute => true
          property :action, :as => "Action", :attribute => true
          property :school_course_info, :as => 'SchoolCourseInfo',
                     :class => SIF::Model::Group::SIS::SchoolCourseInfo,
                     :decorator => Model::Group::SIS::SchoolCourseInfo
          property :school_info, :as => 'SchoolInfo',
                     :class => SIF::Model::Group::SIS::SchoolInfo,
                     :decorator => Model::Group::SIS::SchoolInfo
          property :staff_personal, :as => 'StaffPersonal',
                     :class => SIF::Model::Group::SIS::StaffPersonal,
                     :decorator => Model::Group::SIS::StaffPersonal
          property :student_personal, :as => 'StudentPersonal',
                     :class => SIF::Model::Group::SIS::StudentPersonal,
                     :decorator => Model::Group::SIS::StudentPersonal
          property :student_section_enrollment, :as => 'StudentSectionEnrollment',
                     :class => SIF::Model::Group::SIS::StudentSectionEnrollment,
                     :decorator => Model::Group::SIS::StudentSectionEnrollment
          property :term_info, :as => 'TermInfo',
                     :class => SIF::Model::Group::SIS::TermInfo,
                     :decorator => Model::Group::SIS::TermInfo
          property :section_info, :as => 'SectionInfo',
                     :class => SIF::Model::Group::SIS::SectionInfo,
                     :decorator => Model::Group::SIS::SectionInfo
        end
      end
    end
  end
end
