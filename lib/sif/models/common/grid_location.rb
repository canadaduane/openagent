module SIF
  module Model
    module Common
      class GridLocation
        include Virtus.model

        attribute :latitude, Float
        attribute :longitude, Float
      end
    end
  end
end