require 'virtus'
require 'representable'
require 'representable/xml'
require 'representable/json'

module SIF
  class Represent < Representable::Decorator
    include Representable::XML
    include Representable::JSON
  end

  module Infra
    module Common
      autoload :Application, 'sif/infra/common/application'
      autoload :Condition, 'sif/infra/common/condition'
      autoload :Conditions, 'sif/infra/common/conditions'
      autoload :ConditionGroup, 'sif/infra/common/condition_group'
      autoload :Data, 'sif/infra/common/data'
      autoload :Error, 'sif/infra/common/error'
      autoload :Event, 'sif/infra/common/event'
      autoload :EventObject, 'sif/infra/common/event_object'
      autoload :ExtendedQuery, 'sif/infra/common/extended_query'
      autoload :ExtendedQueryResults, 'sif/infra/common/extended_query_results'
      autoload :Header, 'sif/infra/common/header'
      autoload :Message, 'sif/infra/common/message'
      autoload :Object, 'sif/infra/common/object'
      autoload :ObjectData, 'sif/infra/common/object_data'
      autoload :Property, 'sif/infra/common/property'
      autoload :Protocol, 'sif/infra/common/protocol'
      autoload :Provision, 'sif/infra/common/provision'
      autoload :Query, 'sif/infra/common/query'
      autoload :QueryObject, 'sif/infra/common/query_object'
      autoload :SecureChannel, 'sif/infra/common/secure_channel'
      autoload :Security, 'sif/infra/common/security'
      autoload :Status, 'sif/infra/common/status'
      autoload :Unprovision, 'sif/infra/common/unprovision'
      autoload :Vendor, 'sif/infra/common/vendor'
    end

    module Message
      autoload :Ack, 'sif/infra/messages/ack'
      autoload :Event, 'sif/infra/messages/event'
      autoload :GetMessage, 'sif/infra/messages/get_message'
      autoload :Ping, 'sif/infra/messages/ping'
      autoload :Provide, 'sif/infra/messages/provide'
      autoload :Provision, 'sif/infra/messages/provision'
      autoload :Register, 'sif/infra/messages/register'
      autoload :Request, 'sif/infra/messages/request'
      autoload :Response, 'sif/infra/messages/response'
      autoload :Sleep, 'sif/infra/messages/sleep'
      autoload :Subscribe, 'sif/infra/messages/subscribe'
      autoload :SystemControl, 'sif/infra/messages/system_control'
      autoload :SystemControlData, 'sif/infra/messages/system_control_data'
      autoload :Unprovide, 'sif/infra/messages/unprovide'
      autoload :Unregister, 'sif/infra/messages/unregister'
      autoload :Unsubscribe, 'sif/infra/messages/unsubscribe'
      autoload :Wakeup, 'sif/infra/messages/wakeup'
    end

    module Object
      autoload :AgentACL, 'sif/infra/objects/agent_acl'
      autoload :ZoneStatus, 'sif/infra/objects/zone_status'
    end
  end

  module Model
    module Common
      autoload :Address, 'sif/models/common/address'
      autoload :AlertMessage, 'sif/models/common/alert_message'
      autoload :BaseName, 'sif/models/common/base_name'
      autoload :Code, 'sif/models/common/code'
      autoload :ContactInfo, 'sif/models/common/contact_info'
      autoload :CreditsAttempted, 'sif/models/common/credits_attempted'
      autoload :Demographics, 'sif/models/common/demographics'
      autoload :DwellingArrangement, 'sif/models/common/dwelling_arrangement'
      autoload :Earned_status, 'sif/models/common/earned_status'
      autoload :ElectronicId, 'sif/models/common/electronic_id'
      autoload :EnglishProficiency, 'sif/models/common/english_proficiency'
      autoload :Email, 'sif/models/common/email'
      autoload :ExceptionalityCategory, 'sif/models/common/exceptionality_category'
      autoload :ExtendedElement, 'sif/models/common/extended_element'
      autoload :GradeLevel, 'sif/models/common/grade_level'
      autoload :GridLocation, 'sif/models/common/grid_location'
      autoload :IdentificationInfo, 'sif/models/common/identification_info'
      autoload :Language, 'sif/models/common/language'
      autoload :MealStatus, 'sif/models/common/meal_status'
      autoload :MedicalAlertMessage, 'sif/models/common/medical_alert_message'
      autoload :MeetingTime, 'sif/models/common/meeting_time'
      autoload :Name, 'sif/models/common/name'
      autoload :OtherCode, 'sif/models/common/other_code'
      autoload :OtherId, 'sif/models/common/other_id'
      autoload :PhoneNumber, 'sif/models/common/phone_number'
      autoload :PrincipalInfo, 'sif/models/common/principal_info'
      autoload :Race, 'sif/models/common/race'
      autoload :SCEDCode, 'sif/models/common/sced_code'
      autoload :ScheduleInfo, 'sif/models/common/schedule_info'
      autoload :ScheduleInfoOverride, 'sif/models/common/schedule_info_override'
      autoload :SchoolContact, 'sif/models/common/school_contact'
      autoload :SchoolCourseInfoOverride, 'sif/models/common/school_course_info_override'
      autoload :Street, 'sif/models/common/street'
      autoload :SubjectArea, 'sif/models/common/subject_area'
    end

    module Group
      module DataModel
        autoload :TermSpan, 'sif/models/groups/data_model/term_span'
      end

      module SIS
        autoload :AttendanceCodeInfo, 'sif/models/groups/sis/attendance_code_info'
        autoload :CalendarDate, 'sif/models/groups/sis/calendar_date'
        autoload :DisciplineIncident, 'sif/models/groups/sis/discipline_incident'
        autoload :LEAInfo, 'sif/models/groups/sis/lea_info'
        autoload :PersonalRepresenter, 'sif/models/groups/sis/personal_representer'
        autoload :SchoolCourseInfo, 'sif/models/groups/sis/school_course_info'
        autoload :SchoolInfo, 'sif/models/groups/sis/school_info'
        autoload :SectionInfo, 'sif/models/groups/sis/section_info'
        autoload :SISRepresenter, 'sif/models/groups/sis/sis_representer'
        autoload :StaffPersonal, 'sif/models/groups/sis/staff_personal'
        autoload :StudentPersonal, 'sif/models/groups/sis/student_personal'
        autoload :StudentSectionEnrollment, 'sif/models/groups/sis/student_section_enrollment'
        autoload :TermInfo, 'sif/models/groups/sis/term_info'
      end

      module Grades
        autoload :GradingAssignment, 'sif/models/groups/grades/grading_assignment'
        autoload :GradingAssignmentScore, 'sif/models/groups/grades/grading_assignment_score'
        autoload :GradingCategory, 'sif/models/groups/grades/grading_category'
      end
    end

    module Object
    end
  end

  module Representation
    module Infra
      module Common
        autoload :Application, 'sif/representations/infra/common/application'
        autoload :Condition, 'sif/representations/infra/common/condition'
        autoload :Conditions, 'sif/representations/infra/common/conditions'
        autoload :ConditionGroup, 'sif/representations/infra/common/condition_group'
        autoload :Data, 'sif/representations/infra/common/data'
        autoload :Error, 'sif/representations/infra/common/error'
        autoload :Event, 'sif/representations/infra/common/event'
        autoload :EventObject, 'sif/representations/infra/common/event_object'
        autoload :ExtendedQuery, 'sif/representations/infra/common/extended_query'
        autoload :ExtendedQueryResults, 'sif/representations/infra/common/extended_query_results'
        autoload :Header, 'sif/representations/infra/common/header'
        autoload :Message, 'sif/representations/infra/common/message'
        autoload :Object, 'sif/representations/infra/common/object'
        autoload :ObjectData, 'sif/representations/infra/common/object_data'
        autoload :Property, 'sif/representations/infra/common/property'
        autoload :Protocol, 'sif/representations/infra/common/protocol'
        autoload :Provision, 'sif/representations/infra/common/provision'
        autoload :Query, 'sif/representations/infra/common/query'
        autoload :QueryObject, 'sif/representations/infra/common/query_object'
        autoload :SecureChannel, 'sif/representations/infra/common/secure_channel'
        autoload :Security, 'sif/representations/infra/common/security'
        autoload :Status, 'sif/representations/infra/common/status'
        autoload :Unprovision, 'sif/representations/infra/common/unprovision'
        autoload :Vendor, 'sif/representations/infra/common/vendor'
      end

      module Message
        autoload :Ack, 'sif/representations/infra/messages/ack'
        autoload :Event, 'sif/representations/infra/messages/event'
        autoload :GetMessage, 'sif/representations/infra/messages/get_message'
        autoload :Ping, 'sif/representations/infra/messages/ping'
        autoload :Provide, 'sif/representations/infra/messages/provide'
        autoload :Provision, 'sif/representations/infra/messages/provision'
        autoload :Register, 'sif/representations/infra/messages/register'
        autoload :Request, 'sif/representations/infra/messages/request'
        autoload :Response, 'sif/representations/infra/messages/response'
        autoload :Sleep, 'sif/representations/infra/messages/sleep'
        autoload :Subscribe, 'sif/representations/infra/messages/subscribe'
        autoload :SystemControl, 'sif/representations/infra/messages/system_control'
        autoload :SystemControlData, 'sif/representations/infra/messages/system_control_data'
        autoload :Unprovide, 'sif/representations/infra/messages/unprovide'
        autoload :Unregister, 'sif/representations/infra/messages/unregister'
        autoload :Unsubscribe, 'sif/representations/infra/messages/unsubscribe'
        autoload :Wakeup, 'sif/representations/infra/messages/wakeup'
      end

      module Object
        autoload :AgentACL, 'sif/representations/infra/objects/agent_acl'
        autoload :ZoneStatus, 'sif/representations/infra/objects/zone_status'
      end
    end

    module Model
      module Common
        autoload :Address, 'sif/representations/models/common/address'
        autoload :AlertMessage, 'sif/representations/models/common/alert_message'
        autoload :BaseName, 'sif/representations/models/common/base_name'
        autoload :Code, 'sif/representations/models/common/code'
        autoload :ContactInfo, 'sif/representations/models/common/contact_info'
        autoload :CreditsAttempted, 'sif/representations/models/common/credits_attempted'
        autoload :Demographics, 'sif/representations/models/common/demographics'
        autoload :DwellingArrangement, 'sif/representations/models/common/dwelling_arrangement'
        autoload :Earned_status, 'sif/representations/models/common/earned_status'
        autoload :ElectronicId, 'sif/representations/models/common/electronic_id'
        autoload :EnglishProficiency, 'sif/representations/models/common/english_proficiency'
        autoload :Email, 'sif/representations/models/common/email'
        autoload :ExceptionalityCategory, 'sif/representations/models/common/exceptionality_category'
        autoload :ExtendedElement, 'sif/representations/models/common/extended_element'
        autoload :GradeLevel, 'sif/representations/models/common/grade_level'
        autoload :GridLocation, 'sif/representations/models/common/grid_location'
        autoload :IdentificationInfo, 'sif/representations/models/common/identification_info'
        autoload :Language, 'sif/representations/models/common/language'
        autoload :MealStatus, 'sif/representations/models/common/meal_status'
        autoload :MedicalAlertMessage, 'sif/representations/models/common/medical_alert_message'
        autoload :MeetingTime, 'sif/representations/models/common/meeting_time'
        autoload :Name, 'sif/representations/models/common/name'
        autoload :OtherCode, 'sif/representations/models/common/other_code'
        autoload :OtherId, 'sif/representations/models/common/other_id'
        autoload :PhoneNumber, 'sif/representations/models/common/phone_number'
        autoload :PrincipalInfo, 'sif/representations/models/common/principal_info'
        autoload :Race, 'sif/representations/models/common/race'
        autoload :SCEDCode, 'sif/representations/models/common/sced_code'
        autoload :ScheduleInfo, 'sif/representations/models/common/schedule_info'
        autoload :ScheduleInfoOverride, 'sif/representations/models/common/schedule_info_override'
        autoload :SchoolContact, 'sif/representations/models/common/school_contact'
        autoload :SchoolCourseInfoOverride, 'sif/representations/models/common/school_course_info_override'
        autoload :Street, 'sif/representations/models/common/street'
        autoload :SubjectArea, 'sif/representations/models/common/subject_area'
      end

      module Group
        module DataModel
          autoload :TermSpan, 'sif/representations/models/groups/data_model/term_span'
        end

        module SIS
          autoload :AttendanceCodeInfo, 'sif/representations/models/groups/sis/attendance_code_info'
          autoload :CalendarDate, 'sif/representations/models/groups/sis/calendar_date'
          autoload :DisciplineIncident, 'sif/representations/models/groups/sis/discipline_incident'
          autoload :LEAInfo, 'sif/representations/models/groups/sis/lea_info'
          autoload :PersonalRepresenter, 'sif/representations/models/groups/sis/personal_representer'
          autoload :SchoolCourseInfo, 'sif/representations/models/groups/sis/school_course_info'
          autoload :SchoolInfo, 'sif/representations/models/groups/sis/school_info'
          autoload :SectionInfo, 'sif/representations/models/groups/sis/section_info'
          autoload :SISRepresenter, 'sif/representations/models/groups/sis/sis_representer'
          autoload :StaffPersonal, 'sif/representations/models/groups/sis/staff_personal'
          autoload :StudentPersonal, 'sif/representations/models/groups/sis/student_personal'
          autoload :StudentSectionEnrollment, 'sif/representations/models/groups/sis/student_section_enrollment'
          autoload :TermInfo, 'sif/representations/models/groups/sis/term_info'
        end
        module Grades
          autoload :GradingAssignment, 'sif/representations/models/groups/grades/grading_assignment'
          autoload :GradingAssignmentScore, 'sif/representations/models/groups/grades/grading_assignment_score'
          autoload :GradingCategory, 'sif/representations/models/groups/grades/grading_category'
        end
      end

      module Object
      end
    end
  end
end

MODEL_COMMON = SIF::Model::Common
REPR_COMMON = SIF::Representation::Model::Common

