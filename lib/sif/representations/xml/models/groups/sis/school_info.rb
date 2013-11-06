module SIF
  module Representation
    module XML
      module Model
        module Group
          module SIS
            class SchoolInfo < Representable::Decorator
              include Representable::XML

              self.representation_wrap = 'SchoolInfo'

              property :ref_id, :attribute => true, :as => "RefId"
              property :local_id, :as => "LocalId"
              property :state_province_id, :as => "StateProvinceId"
              property :nces_id, :as => "NCESId"
              property :school_name, :as => "SchoolName"
              property :lea_info_ref_id, :as => "LEAInfoRefId"
              property :other_lea, :as => "OtherLEA",
                       :class => SIF::Model::RefObject,  #TODO: build SIF_RefObject?
                       :decorator => SIF::Representation::XML::RefObject #TODO: build XML version?
              property :school_type, :as => "SchoolType"
              collection :school_focuses, :as => "SchoolFocusList",
                         :class => SIF::Model::SchoolFocus,  #TODO:
                         :decorator => SIF::Representation::XML::SchoolFocus
              property :school_url, :as => "SchoolURL"
              property :principal_info, :as => "PrincipalInfo"
              collection :school_contacts, :as => "SchoolContactList"
              collection :addresses, :as => "AddressList"
              collection :phone_numbers, :as => "PhoneNumberList"
              property :identification_infos => "IdentificationInfoList"
              property :session_type, :as "SessionType"
              property :grade_levels, :as "GradeLevels"
              property :title_1_status, :as => "Title1Status"
              property :operational_status => "OperationalStatus"
              property :congressional_district => "CongressionalDistrict"
              property :metadata => "SIF_Metadata"
              property :extended_elemetns => "SIF_ExtendedElements"
            end
          end
        end
      end
    end
  end
end