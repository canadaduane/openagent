module SIF
  module Model
    module Common
      class SchoolContact
        require_relative 'contact_info'
        include Virtus.model

        attribute :publish_in_directory, Boolean
        attribute :contact_info, ContactInfo
      end
    end
  end
end