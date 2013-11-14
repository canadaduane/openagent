module SIF
  module Model
    module Common
      class LEAInfo
        include Virtus.model

        attribute :ref_id, String
        attribute :local_id, String
        attribute :state_province_id, String
        attribute :nces_id, String
        attribute :lea_name, String
        attribute :lea_url, String
        attribute :education_agency_type, Integer
        attribute :lea_contacts, Array[String]
        attribute :phone_numbers, Array[Common::PhoneNumber]
        attribute :addresses, Array[Common::Address]
        attribute :identification_infos, Array[String]
        attribute :grade_levels
        attribute :operational_status, String
        attribute :congressional_district, String
        attribute :metadata
        attribute :extended_elements
      end
    end
  end
end