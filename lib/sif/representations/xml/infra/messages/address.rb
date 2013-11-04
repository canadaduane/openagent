module SIF
  module Representation
    module XML
      class Address < Representable::Decorator
        include Representable::XML

        self.representation_wrap = 'SIF_Address'

        property :type, :as => 'Type', :attribute => true
        property :street, :as => 'Street'
        property :city, :as => 'City'
        property :county, :as => 'County'
        property :state_province, :as => 'StateProvince'
        property :country, :as => 'Country'
        property :postal_code, :as => 'PostalCode'
        property :grid_location, :as => 'GridLocation'
      end
    end
  end
end