module SIF
  module Representation
    module XML
      module Model
        module Common
          class ContactInfo < Representable::Decorator
            include Representable::XML
            require_relative 'phone_number'
            require_relative 'address'
            require_relative 'email'

            self.representation_wrap = 'ContactInfo'

            property :name, :as => 'Name'
            property :position_title => 'PositionTitle'
            property :role => 'Role'
            collection :emails => 'Email', :wrap => 'EmailList',
                       :class => MODEL_COMMON::Email,
                       :decorator => XML_COMMON::Email
            property :address => 'Address',
                     :class => MODEL_COMMON::Address,
                     :decorator => XML_COMMON::Address
            collection :phone_numbers => 'PhoneNumber', :wrap => 'PhoneNumberList',
                       :class => MODEL_COMMON::PhoneNumber,
                       :decorator => XML_COMMON::PhoneNumber
          end
        end
      end
    end
  end
end