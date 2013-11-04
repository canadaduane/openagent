require_relative 'name'
require_relative 'address'
require_relative 'email'
require_relative 'phone_number'

module SIF
  module Model
    module Common
      class ContactInfo
        include Virtus.model

        attribute :name, Name
        attribute :position_title, String
        attribute :role, String
        attribute :address, Address
        attribute :emails, Array[Email]
        attribute :phone_numbers, Array[PhoneNumber]
      end
    end
  end
end