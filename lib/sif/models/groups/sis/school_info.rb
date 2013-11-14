module SIF
  module Model
    module Group
      module SIS
        class SchoolInfo
          include Virtus.model

          attribute :ref_id, String
          attribute :local_id, String
          attribute :state_province_id, String
          attribute :nces_id, String
          attribute :school_name, String
          attribute :lea_info_ref_id, String
          attribute :other_lea, String
          attribute :school_type, String
          attribute :school_focuses, String
          attribute :school_url, String
          attribute :principal_info, Common::PrincipalInfo
          attribute :school_contacts, Array[Common::SchoolContact]
          attribute :addresses, Array[Common::Address]
          attribute :phone_numbers, Array[Common::PhoneNumber]
          attribute :identification_infos, Common::IdentificationInfo
          attribute :session_type, String
          attribute :grade_levels, String
          attribute :title_1_status, String
          attribute :operational_status, String
          attribute :congressional_district, String
        end
      end
    end
  end
end