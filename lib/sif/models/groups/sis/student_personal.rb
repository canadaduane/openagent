require 'date'

module SIF
  module Model
    module Group
      module SIS
        class StudentPersonal
          include Virtus.model

          attribute :name, String
          attribute :ref_id, String
          attribute :local_id, String
          attribute :state_province_id, String
          attribute :other_names, String
          attribute :projected_graduation_year, Integer
          attribute :on_time_graduation_year, Integer
          attribute :graduation_date, Date
          attribute :most_recent, String
          attribute :acceptable_use_policy, String
          attribute :idea, String
          attribute :migrant, String
          attribute :title1, String
          attribute :gifted_talented, String
          attribute :ell, String
          attribute :homeless, String
          attribute :section504, String
          attribute :vocational_concentrator, String
          attribute :immigrant, String
          attribute :neglected_delinquent, String
          attribute :metadata, String
          attribute :extended_elements, String

          attribute :alert_messages,         Array[Common::AlertMessage]
          attribute :medical_alert_messages, Array[Common::MedicalAlertMessage]
          attribute :electronic_ids,         Array[Common::ElectronicId]
          attribute :other_ids,              Array[Common::OtherId]
          attribute :addresses,              Array[Common::Address]
          attribute :phone_numbers,          Array[Common::PhoneNumber]
          attribute :emails,                 Array[Common::Email]
          attribute :demographics,           String
        end
      end
    end
  end
end
