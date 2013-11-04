require 'date'

module SIF
  module Model
    module Common
      class EarnedStatus
        include Virtus.model

        attribute :type, String
        attribute :start_date, Date
        attribute :end_date, Date
      end
    end
  end
end