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
          attribute :alert_messages, Array[Common::AlertMessage]
          attribute :medical_alert_messages, Array[Common::MedicalAlertMessage]
          attribute :state_province_id, String
          attribute :electronic_ids, Array[Common::ElectronicId]
          attribute :other_ids, Array[Common::OtherId]
          attribute :other_names, String
          attribute :demographics, String
          attribute :addresses, Array[Common::Address]
          attribute :phone_numbers, Array[Common::PhoneNumber]
          attribute :emails, Array[Common::Email]
          attribute :projected_graduation_year, Integer
          attribute :on_time_graduation_year, Integer
          attribute :graduation_date, Date
        end
      end
    end
  end
end
