require 'date'

module SIF
  module Model
    module Common
      class MealStatus
        include Virtus.model

        attribute :type, String
        attribute :start_date, Date
        attribute :end_date, Date
        attribute :school_year, Integer
      end
    end
  end
end