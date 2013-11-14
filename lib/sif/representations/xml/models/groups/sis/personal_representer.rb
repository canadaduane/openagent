module SIF
  module Representation
    module XML
      module Model
        module Group
          module SIS
            module PersonalRepresenter
              include Representable::XML

              property   :name, :as => 'Name',
                         :class => MODEL_COMMON::Name,
                         :decorator => XML_COMMON::Name
              property   :local_id, :as => 'LocalId'
              property   :state_province_id, :as => 'StateProvinceId'
              collection :electronic_ids, :as => 'ElectronicId', :wrap => 'ElectronicIdList',
                         :class => MODEL_COMMON::ElectronicId,
                         :decorator => XML_COMMON::ElectronicId
              collection :other_ids, :as => 'OtherId', :wrap => 'OtherIdList',
                         :class => MODEL_COMMON::OtherId,
                         :decorator => XML_COMMON::OtherId
              property   :other_names, :as => 'OtherNames'
              property   :demographics, :as => 'Demographics',
                         :class => MODEL_COMMON::Demographics,
                         :decorator => XML_COMMON::Demographics
              collection :addresses, :as => 'Address', :wrap => 'AddressList',
                         :class => MODEL_COMMON::Address,
                         :decorator => XML_COMMON::Address
              collection :phone_numbers, :as => 'PhoneNumber', :wrap => 'PhoneNumberList',
                         :class => MODEL_COMMON::PhoneNumber,
                         :decorator => XML_COMMON::PhoneNumber
              collection :emails, :as => 'Email', :wrap => 'EmailList',
                         :class => MODEL_COMMON::Email,
                         :decorator => XML_COMMON::Email
            end
          end
        end
      end
    end
  end
end

