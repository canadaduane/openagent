require_relative 'sis_representer'

module SIF
  module Representation
    module XML
      module Model
        module Group
          module SIS
            class SchoolInfo < SIF::Representation
              include SISRepresenter
              
              self.representation_wrap = 'SchoolInfo'

              property :local_id, :as => 'LocalId'
              property :state_province_id, :as => 'StateProvinceId'
              property :nces_id, :as => 'NCESId'
              property :school_name, :as => 'SchoolName'
              property :lea_info_ref_id, :as => 'LEAInfoRefId'
              property :other_lea, :as => 'OtherLEA'
              property :school_type, :as => 'SchoolType'
              collection :school_focuses, :as => 'SchoolFocus', :wrap => 'SchoolFocusList'
              property :school_url, :as => 'SchoolURL'
              property :principal_info, :as => 'PrincipalInfo',
                       :class => MODEL_COMMON::PrincipalInfo,
                       :decorator => XML_COMMON::PrincipalInfo
              collection :school_contacts, :as => 'SchoolContact', :wrap => 'SchoolContactList',
                         :class => MODEL_COMMON::SchoolContact,
                         :decorator => XML_COMMON::SchoolContact
              collection :addresses, :as => 'Address', :wrap => 'AddressList',
                         :class => MODEL_COMMON::Address,
                         :decorator => XML_COMMON::Address
              collection :phone_numbers, :as => 'PhoneNumber', :wrap => 'PhoneNumberList',
                         :class => MODEL_COMMON::PhoneNumber,
                         :decorator => XML_COMMON::PhoneNumber
              property :identification_infos, :as => 'IdentificationInfo', :wrap => 'IdentificationInfoList',
                       :class => MODEL_COMMON::IdentificationInfo,
                       :decorator => XML_COMMON::IdentificationInfo
              property :session_type, :as => 'SessionType'
              property :grade_levels, :as => 'GradeLevels'
              property :title_1_status, :as => 'Title1Status'
              property :operational_status, :as => 'OperationalStatus'
              property :congressional_district, :as => 'CongressionalDistrict'
            end
          end
        end
      end
    end
  end
end