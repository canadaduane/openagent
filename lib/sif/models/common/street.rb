module SIF
  module Model
    module Common
      class Street
        include Virtus.model

        attribute :line1, String
        attribute :line2, String
        attribute :line3, String
        attribute :complex, String
        attribute :street_number, String
        attribute :street_prefix, String
        attribute :street_name, String
        attribute :street_suffix, String
        attribute :apartment_number_prefix, String
        attribute :apartment_number, String
        attribute :apartment_number_suffix, String
      end
    end
  end
end