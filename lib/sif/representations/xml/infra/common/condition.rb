module SIF
  module Representation
    module XML
      module Infra
        module Common
          class Condition < SIF::Representation

            self.representation_wrap = 'SIF_Condition'

            property :element, :as => 'SIF_Element'
            property :operator, :as => 'SIF_Operator'
            property :value, :as => 'SIF_Value'
          end
        end
      end
    end
  end
end