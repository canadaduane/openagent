module SIF
  module Representation
    module Model
      module Common
        class GridLocation < SIF::Represent

          self.representation_wrap = 'GridLocation'

          property :latitude, :as => 'Latitude'
          property :longitude, :as => 'Longitude'

        end
      end
    end
  end
end