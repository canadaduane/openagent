module SIF
  module Representation
    module XML
      module Model
        module Group
          module SIS
            class SchoolInfo < Representable::Decorator
              include Representable::XML
              include SISRepresenter
              self.representation_wrap = 'SchoolInfo'

              property :local_id, :as => 'LocalId'
              property :state_province_id, :as => 'StateProvinceId'
              property :nces_id, :as => 'NCESId'
              property :school_name, :as => 'SchoolName'
              property :lea_info_ref_id, :as => 'LEAInfoRefId'
              property :other_lea, :as => 'OtherLEA',
                       :class => SIF_MODEL::RefObject,
                       :decorator => SIF_XML::RefObject
              property :school_type, :as => 'SchoolType'
              collection :school_focuses, :as => 'SchoolFocusList',
                         :class => SIF_MODEL::SchoolFocus,
                         :decorator => SIF_XML::SchoolFocus
              property :school_url, :as => 'SchoolURL'
              property :principal_info, :as => 'PrincipalInfo',
                       :class => SIF_MODEL::PrincipalInfo,
                       :decorator => SIF_XML::PrincipalInfo
              collection :school_contacts, :as => 'SchoolContactList',
                         :class => SIF_MODEL::SchoolContact,
                         :decorator => SIF_XML::SchoolContact
              collection :addresses, :as => 'AddressList',
                         :class => SIF_MODEL::Address,
                         :decorator => SIF_XML::Address
              collection :phone_numbers, :as => 'PhoneNumberList',
                         :class => SIF_MODEL::Phone,
                         :decorator => SIF_XML::Phone
              property :identification_infos => 'IdentificationInfoList',
                       :class => SIF_MODEL::IdentificationInfo,
                       :decorator => SIF_XML::IdentificationInfo
              property :session_type, :as => 'SessionType'
              property :grade_levels, :as => 'GradeLevels'
              property :title_1_status, :as => 'Title1Status'
              property :operational_status => 'OperationalStatus'
              property :congressional_district => 'CongressionalDistrict'
            end
          end
        end
      end
    end
  end
end