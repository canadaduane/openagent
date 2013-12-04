require 'date'

module SIF
  module Model
    module Group
      module SIS
        class StudentPersonal
          require_relative 'personal_representer'
          require_relative 'sis_representer'

          include Virtus.model
          include PersonalRepresenter
          include SISRepresenter

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

          attribute :alert_messages,         Array[Common::AlertMessage]
          attribute :medical_alert_messages, Array[Common::MedicalAlertMessage]

          def student_email
            find_element("STUDENT_EMAIL")
          end
          def email
            student_email || first_email
          end
        end
      end
    end
  end
end
