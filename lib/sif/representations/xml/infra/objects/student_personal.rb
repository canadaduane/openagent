module SIF
  module Representation
    module XML
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
                  :class => SIF::Model::AlertMessage,
                  :decorator => SIF::Representation::XML::AlertMessage
        collection :medical_alert_messages, :as => "MedicalAlertMessages",
                  :class => SIF::Model::MedicalAlertMessage,
                  :decorator => SIF::Representation::XML::MedicalAlertMessage
        collection :electronic_ids, :as => "ElectronicIdList",
                  :class => SIF::Model::ElectronicId,
                  :decorator => SIF::Representation::XML::ElectronicId
        collection :other_ids, :as => "OtherIdList",
                  :class => SIF::Model::OtherId,
                  :decorator => SIF::Representation::XML::OtherId
        collection :addresses, :as => "AddressList",
                  :class => SIF::Model::Address,
                  :decorator => SIF::Representation::XML::Address
        collection :phone_numbers, :as => "PhoneNumberList",
                  :class => SIF::Model::PhoneNumber,
                  :decorator => SIF::Representation::XML::PhoneNumber
        collection :emails, :as => "EmailList",
                  :class => SIF::Model::Email,
                  :decorator => SIF::Representation::XML::Email
        property  :demographics, :as => "Demographics",
                  :class => SIF::Model::Demographics,
                  :decorator => SIF::Representation::XML::Demographics
      end
    end
  end
end