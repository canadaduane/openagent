require 'virtus'
require 'representable'
require 'representable/xml'

module SIF
  module Infra
    module Common
      autoload :Application, 'sif/infra/common/application'
      autoload :Condition, 'sif/infra/common/condition'
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
    end

    module Object
    end
  end

  module Representation
    module XML
      module Infra
        module Common
          autoload :Application, 'sif/representations/xml/infra/common/application'
          autoload :Condition, 'sif/representations/xml/infra/common/condition'
          autoload :ConditionGroup, 'sif/representations/xml/infra/common/condition_group'
          autoload :Data, 'sif/representations/xml/infra/common/data'
          autoload :Error, 'sif/representations/xml/infra/common/error'
          autoload :Event, 'sif/representations/xml/infra/common/event'
          autoload :EventObject, 'sif/representations/xml/infra/common/event_object'
          autoload :ExtendedQuery, 'sif/representations/xml/infra/common/extended_query'
          autoload :ExtendedQueryResults, 'sif/representations/xml/infra/common/extended_query_results'
          autoload :Header, 'sif/representations/xml/infra/common/header'
          autoload :Message, 'sif/representations/xml/infra/common/message'
          autoload :Object, 'sif/representations/xml/infra/common/object'
          autoload :ObjectData, 'sif/representations/xml/infra/common/object_data'
          autoload :Property, 'sif/representations/xml/infra/common/property'
          autoload :Protocol, 'sif/representations/xml/infra/common/protocol'
          autoload :Provision, 'sif/representations/xml/infra/common/provision'
          autoload :Query, 'sif/representations/xml/infra/common/query'
          autoload :QueryObject, 'sif/representations/xml/infra/common/query_object'
          autoload :SecureChannel, 'sif/representations/xml/infra/common/secure_channel'
          autoload :Security, 'sif/representations/xml/infra/common/security'
          autoload :Status, 'sif/representations/xml/infra/common/status'
          autoload :Unprovision, 'sif/representations/xml/infra/common/unprovision'
          autoload :Vendor, 'sif/representations/xml/infra/common/vendor'
        end

        module Message
          autoload :Ack, 'sif/representations/xml/infra/messages/ack'
          autoload :Event, 'sif/representations/xml/infra/messages/event'
          autoload :GetMessage, 'sif/representations/xml/infra/messages/get_message'
          autoload :Ping, 'sif/representations/xml/infra/messages/ping'
          autoload :Provide, 'sif/representations/xml/infra/messages/provide'
          autoload :Provision, 'sif/representations/xml/infra/messages/provision'
          autoload :Register, 'sif/representations/xml/infra/messages/register'
          autoload :Request, 'sif/representations/xml/infra/messages/request'
          autoload :Response, 'sif/representations/xml/infra/messages/response'
          autoload :Sleep, 'sif/representations/xml/infra/messages/sleep'
          autoload :Subscribe, 'sif/representations/xml/infra/messages/subscribe'
          autoload :SystemControl, 'sif/representations/xml/infra/messages/system_control'
          autoload :SystemControlData, 'sif/representations/xml/infra/messages/system_control_data'
          autoload :Unprovide, 'sif/representations/xml/infra/messages/unprovide'
          autoload :Unregister, 'sif/representations/xml/infra/messages/unregister'
          autoload :Unsubscribe, 'sif/representations/xml/infra/messages/unsubscribe'
          autoload :Wakeup, 'sif/representations/xml/infra/messages/wakeup'
        end

        module Object
          autoload :AgentACL, 'sif/representations/xml/infra/objects/agent_acl'
          autoload :ZoneStatus, 'sif/representations/xml/infra/objects/zone_status'
        end
      end

      module Model
        module Common
          autoload :Address, 'sif/representations/xml/models/common/address'
          autoload :AlertMessage, 'sif/representations/xml/models/common/alert_message'
          autoload :BaseName, 'sif/representations/xml/models/common/base_name'
          autoload :Code, 'sif/representations/xml/models/common/code'
          autoload :ContactInfo, 'sif/representations/xml/models/common/contact_info'
          autoload :CreditsAttempted, 'sif/representations/xml/models/common/credits_attempted'
          autoload :Demographics, 'sif/representations/xml/models/common/demographics'
          autoload :DwellingArrangement, 'sif/representations/xml/models/common/dwelling_arrangement'
          autoload :Earned_status, 'sif/representations/xml/models/common/earned_status'
          autoload :ElectronicId, 'sif/representations/xml/models/common/electronic_id'
          autoload :EnglishProficiency, 'sif/representations/xml/models/common/english_proficiency'
          autoload :Email, 'sif/representations/xml/models/common/email'
          autoload :ExceptionalityCategory, 'sif/representations/xml/models/common/exceptionality_category'
          autoload :GradeLevel, 'sif/representations/xml/models/common/grade_level'
          autoload :GridLocation, 'sif/representations/xml/models/common/grid_location'
          autoload :IdentificationInfo, 'sif/representations/xml/models/common/identification_info'
          autoload :Language, 'sif/representations/xml/models/common/language'
          autoload :MealStatus, 'sif/representations/xml/models/common/meal_status'
          autoload :MedicalAlertMessage, 'sif/representations/xml/models/common/medical_alert_message'
          autoload :MeetingTime, 'sif/representations/xml/models/common/meeting_time'
          autoload :Name, 'sif/representations/xml/models/common/name'
          autoload :OtherCode, 'sif/representations/xml/models/common/other_code'
          autoload :OtherId, 'sif/representations/xml/models/common/other_id'
          autoload :PhoneNumber, 'sif/representations/xml/models/common/phone_number'
          autoload :PrincipalInfo, 'sif/representations/xml/models/common/principal_info'
          autoload :Race, 'sif/representations/xml/models/common/race'
          autoload :SCEDCode, 'sif/representations/xml/models/common/sced_code'
          autoload :ScheduleInfo, 'sif/representations/xml/models/common/schedule_info'
          autoload :ScheduleInfoOverride, 'sif/representations/xml/models/common/schedule_info_override'
          autoload :SchoolContact, 'sif/representations/xml/models/common/school_contact'
          autoload :SchoolCourseInfoOverride, 'sif/representations/xml/models/common/school_course_info_override'
          autoload :Street, 'sif/representations/xml/models/common/street'
          autoload :SubjectArea, 'sif/representations/xml/models/common/subject_area'
        end

        module Group
          module DataModel
            autoload :TermSpan, 'sif/representations/xml/models/groups/data_model/term_span'
          end

          module SIS
            autoload :AttendanceCodeInfo, 'sif/representations/xml/models/groups/sis/attendance_code_info'
            autoload :CalendarDate, 'sif/representations/xml/models/groups/sis/calendar_date'
            autoload :DisciplineIncident, 'sif/representations/xml/models/groups/sis/discipline_incident'
            autoload :LEAInfo, 'sif/representations/xml/models/groups/sis/lea_info'
            autoload :PersonalRepresenter, 'sif/representations/xml/models/groups/sis/personal_representer'
            autoload :SchoolCourseInfo, 'sif/representations/xml/models/groups/sis/school_course_info'
            autoload :SchoolInfo, 'sif/representations/xml/models/groups/sis/school_info'
            autoload :SectionInfo, 'sif/representations/xml/models/groups/sis/section_info'
            autoload :SISRepresenter, 'sif/representations/xml/models/groups/sis/sis_representer'
            autoload :StaffPersonal, 'sif/representations/xml/models/groups/sis/staff_personal'
            autoload :StudentPersonal, 'sif/representations/xml/models/groups/sis/student_personal'
            autoload :StudentSectionEnrollment, 'sif/representations/xml/models/groups/sis/student_section_enrollment'
            autoload :TermInfo, 'sif/representations/xml/models/groups/sis/term_info'
          end
        end

        module Object
        end
      end
    end
  end
end

MODEL_COMMON = SIF::Model::Common
XML_COMMON = SIF::Representation::XML::Model::Common

