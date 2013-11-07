require 'sif/models'
require 'sif/representations/xml/models'

module SIF
  module Representation
    module XML
      module Model
        module Group
          module SIS
            class StudentPersonal < Representable::Decorator
              include Representable::XML

              self.representation_wrap = 'StudentPersonal'

              property :name, :as => "Name"
              property :ref_id, :attribute => true, :as => "RefId"
              property :local_id, :as => "LocalId"
              property :state_province_id, :as => "StateProvinceId"
              property :other_names, :as => "OtherName"
              property :projected_graduation_year, :as => "ProjectedGraduationYear"
              property :on_time_graduation_year, :as => "OnTimeGraduationYear"
              property :graduation_date, :as => "GraduationDate"
              property :most_recent, :as => "MostRecent"
              property :acceptable_use_policy, :as => "AcceptableUsePolicy"
              property :idea, :as => "IDEA"
              property :migrant, :as => "Migrant"
              property :title1, :as => "Title1"
              property :gifted_talented, :as => "GiftedTalented"
              property :ell, :as => "ELL"
              property :homeless, :as => "Homeless"
              property :section504, :as => "Section504"
              property :vocational_concentrator, :as => "VocationalConcentrator"
              property :immigrant, :as => "Immigrant"
              property :neglected_delinquent, :as => "NeglectedDelinquent"
              property :metadata, :as => "SIF_Metadata"
              property :extended_elements, :as => "SIF_ExtendedElements"

              collection :alert_messages, :as => "AlertMessages",
                         :class => SIF::Model::Common::AlertMessage,
                         :decorator => SIF::Representation::XML::Model::Common::AlertMessage
              collection :medical_alert_messages, :as => "MedicalAlertMessages",
                         :class => SIF::Model::Common::MedicalAlertMessage,
                         :decorator => SIF::Representation::XML::Model::Common::MedicalAlertMessage
              # collection :electronic_ids, :as => "ElectronicIdList",
              #            :class => SIF::Model::Common::ElectronicId,
              #            :decorator => SIF::Representation::XML::Model::Common::ElectronicId
              # collection :other_ids, :as => "OtherIdList",
              #            :class => SIF::Model::Common::OtherId,
              #            :decorator => SIF::Representation::XML::Model::Common::OtherId
              # collection :addresses, :as => "AddressList",
              #            :class => SIF::Model::Common::Address,
              #            :decorator => SIF::Representation::XML::Model::Common::Address
              # collection :phone_numbers, :as => "PhoneNumberList",
              #            :class => SIF::Model::Common::PhoneNumber,
              #            :decorator => SIF::Representation::XML::Model::Common::PhoneNumber
              # collection :emails, :as => "EmailList",
              #            :class => SIF::Model::Common::Email,
              #            :decorator => SIF::Representation::XML::Model::Common::Email
              # property  :demographics, :as => "Demographics",
              #           :class => SIF::Model::Common::Demographics,
              #           :decorator => SIF::Representation::XML::Model::Common::Demographics
            end
          end
        end
      end
    end
  end
end