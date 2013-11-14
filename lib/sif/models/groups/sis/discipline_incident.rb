require 'date'

module SIF
  module Model
    module Group
      module SIS
        class DisciplineIncident
          include Virtus.model

          attribute :ref_id, String
          attribute :school_year, Integer
          attribute :agency_reporting
          attribute :incident_number, String
          attribute :incident_date, Date
          attribute :incident_time, Time
          attribute :incident_location, String
          attribute :incident_location_ref_id, String
          attribute :incident_cost, String
          attribute :incident_reporter
          attribute :related_tos
          attribute :weapon_types
          attribute :incident_category
          attribute :offenders
          attribute :victims
          attribute :metadata
          attribute :extended_elements
        end
      end
    end
  end
end