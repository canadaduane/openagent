module SIF
  module Representation
    module XML
      module Model
        module Common
          class Demographics < Representable::Decorator
            require_relative 'race'
            require_relative 'english_proficiency'
            require_relative 'language'
            require_relative 'dwelling_arrangement'

            include Representable::XML

            self.representation_wrap = 'Demographics'

            collection :races, :as => 'Race', :wrap => 'RaceList',
                       :class => MODEL_COMMON::Race,
                       :representation => XML_COMMON::Race

            property :hispanic_latino, :as => 'HispanicLatino'
            property :gender, :as => 'Gender'
            property :birth_date, :as => 'BirthDate'
            property :birth_date_verification, :as => 'BirthDateVerification'
            property :place_of_birth, :as => 'PlaceOfBirth'
            property :county_of_birth, :as => 'CountyOfBirth'
            property :state_of_birth, :as => 'StateOfBirth'
            property :country_of_birth, :as => 'CountryOfBirth'
            collection :countries_of_citizenship, :as => 'CountryOfCitizenShip', :wrap => 'CountriesOfCitizenship'
            collection :countries_of_citizenship, :as => 'CountryOfResidency', :wrap => 'CountriesOfResidency'
            property :country_arrival_date, :as => 'CountryArrivalDate'
            property :citizenship_status, :as => 'CitizenShipStatus'
            property :english_proficiency, :as => 'EnglishProficiency',
                     :class => MODEL_COMMON::EnglishProficiency,
                     :representation => XML_COMMON::EnglishProficiency
            collection :languages, :as => 'Languages', :wrap => 'LanguageList',
                     :class => MODEL_COMMON::Language,
                     :demographics => XML_COMMON::Language
            property :dwelling_arrangement, :as => 'DwellingArrangement',
                     :class => MODEL_COMMON::DwellingArrangement,
                     :demographics => XML_COMMON::DwellingArrangement
            property :marital_status, :as => 'MaritalStatus'
          end
        end
      end
    end
  end
end