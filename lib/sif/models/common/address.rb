require_relative 'street'
require_relative 'grid_location'

module SIF
  module Model
    module Common
      class Address
        include Virtus.model

        attribute :type, String
        attribute :street, Street
        attribute :city, String
        attribute :county, String
        attribute :state_province, String
        attribute :country, String
        attribute :postal_code, String
        attribute :grid_location, GridLocation
      end
    end
  end
end