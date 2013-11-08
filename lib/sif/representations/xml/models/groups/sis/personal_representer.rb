module SIF
  module Representation
    module XML
      module Model
        module Group
          module SIS
            module PersonalRepresenter
              include Representable::XML
              include ContactRepresenter

              property   :name, :as => 'Name'
              property   :local_id, :as => 'LocalId'
              property   :state_province_id, :as => 'StateProvinceId'
              collection :electronic_ids, :as => 'ElectronicIdList',
                         :class => SIF_MODEL::ElectronicId,
                         :decorator => SIF_XML::ElectronicId
              collection :other_ids, :as => 'OtherIdList',
                         :class => SIF_MODEL::OtherId,
                         :decorator => SIF_XML::OtherId
              property   :other_names, :as => 'OtherNames'
              property   :demographics, :as => 'Demographics',
                         :class => SIF_MODEL::Demographics,
                         :decorator => SIF_XML::Demographics
              collection :addresses, :as => 'AddressList',
                         :class => SIF_MODEL::Address,
                         :decorator => SIF_XML::Address
              collection :phone_numbers, :as => 'PhoneNumberList',
                         :class => SIF_MODEL::PhoneNumber,
                         :decorator => SIF_XML::PhoneNumber
              collection :emails, :as => 'EmailList',
                         :class => SIF_MODEL::Email,
                         :decorator => SIF_XML::Email
            end
          end
        end
      end
    end
  end
end

