module SIF
  module Representation
    module XML
      module Model
        module Group
          module SIS
            module PersonalRepresenter
              include Representable::XML

              property   :local_id, :as => "LocalId"
              property   :state_province_id, :as => "StateProvinceId"
              collection :electronic_ids, :as => "ElectronicIdList",
                         :class => SIF::Model::ElectronicId,
                         :decorator => SIF::Representation::XML::ElectronicId
              collection :other_ids, :as => "OtherIdList",
                         :class => SIF::Model::OtherId,
                         :decorator => SIF::Representation::XML::OtherId
              property   :name, :as => "Name"
              property   :other_names, :as => "OtherName"
              property   :demographics, :as => "Demographics",
                         :class => SIF::Model::Demographics,
                         :decorator => SIF::Representation::XML::Demographics
              collection :addresses, :as => "AddressList",
                         :class => SIF::Model::Address,
                         :decorator => SIF::Representation::XML::Address
              collection :phone_numbers, :as => "PhoneNumberList",
                         :class => SIF::Model::PhoneNumber,
                         :decorator => SIF::Representation::XML::PhoneNumber
              collection :emails, :as => "EmailList",
                         :class => SIF::Model::Email,
                         :decorator => SIF::Representation::XML::Email
            end
          end
        end
      end
    end
  end
end

