require 'date'

module SIF
  module Model
    class StudentPersonal
      include Virtus.model

      attribute :name, String
      attribute :ref_id, String
      attribute :local_id, String
      attribute :alert_messages, Array[AlertMessage]
      attribute :medical_alert_messages, Array[MedicalAlertMessage]
      attribute :state_province_id, String
      attribute :electronic_ids, Array[ElectronicId]
      attribute :other_ids, Array[OtherId]
      attribute :other_names, String
      attribute :demographics, String
      attribute :addresses, Array[Address]
      attribute :phone_numbers, Array[PhoneNumber]
      attribute :emails, Array[Email]
      attribute :projected_graduation_year, Integer
      attribute :on_time_graduation_year, Integer
      attribute :graduation_date, Date

    end
  end
end
