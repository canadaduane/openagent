require 'date'
require_relative 'language'
require_relative 'race'

module SIF
  module Model
    module Common
      class Demographics
        include Virtus.model

        attribute :races, Array[Race]
        attribute :hispanic_latino, Boolean
        attribute :gender, String
        attribute :birth_date, Date
        attribute :birth_date_verification, String
        attribute :place_of_birth, String
        attribute :county_of_birth, String
        attribute :state_of_birth, String
        attribute :country_of_birth, String
        attribute :countries_of_citizenship, Array[String]
        attribute :countries_of_residency, Array[String]
        attribute :country_arrival_date, Date
        attribute :citizenship_status, Integer
        attribute :english_proficiency
        attribute :languages, Array[Language]
        attribute :dwelling_arrangement, String
        attribute :marital_status, String
      end
    end
  end
end