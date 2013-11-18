module SIF
  module Representation
    module Model
      module Common
        class ContactInfo < SIF::Represent
          require_relative 'phone_number'
          require_relative 'address'
          require_relative 'email'

          self.representation_wrap = 'ContactInfo'

          property :name, :as => 'Name',
                   :class => MODEL_COMMON::Name,
                   :decorator => REPR_COMMON::Name
          property :position_title, :as => 'PositionTitle'
          property :role, :as => 'Role'
          collection :emails, :as => 'Email', :wrap => 'EmailList',
                     :class => MODEL_COMMON::Email,
                     :decorator => REPR_COMMON::Email
          property :address, :as => 'Address',
                   :class => MODEL_COMMON::Address,
                   :decorator => REPR_COMMON::Address
          collection :phone_numbers, :as => 'PhoneNumber', :wrap => 'PhoneNumberList',
                     :class => MODEL_COMMON::PhoneNumber,
                     :decorator => REPR_COMMON::PhoneNumber
        end
      end
    end
  end
end
