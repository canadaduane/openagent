module SIF
  module Representation
    module XML
      module Model
        module Common
          class Street < SIF::Represent

            self.representation_wrap = 'Street'

            property :line1, :as => 'Line1'
            property :line2, :as => 'Line2'
            property :line3, :as => 'Line3'
            property :complex, :as => 'Complex'
            property :street_number, :as => 'StreetNumber'
            property :street_prefix, :as => 'StreetPrefix'
            property :street_name, :as => 'StreetName'
            property :street_type, :as => 'StreetType'
            property :street_suffix, :as => 'StreetSuffix'
            property :apartment_type, :as => 'ApartmentType'
            property :apartment_number_prefix, :as => 'ApartmentNumberPrefix'
            property :apartment_number, :as => 'ApartmentNumber'
            property :apartment_number_suffix, :as => 'ApartmentNumberSuffix'
          end
        end
      end
    end
  end
end