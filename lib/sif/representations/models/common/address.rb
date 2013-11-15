module SIF
  module Representation
    module Model
      module Common
        class Address < SIF::Represent
          require_relative 'street'

          self.representation_wrap = 'SIF_Address'

          property :type, :as => 'Type', :attribute => true
          property :street, :as => 'Street',
                   :class => MODEL_COMMON::Street,
                   :decorator => REPR_COMMON::Street
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
end
