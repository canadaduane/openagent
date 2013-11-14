module SIF
  module Representation
    module XML
      module Infra
        module Common
          class QueryObject < SIF::Representation

            self.representation_wrap = 'SIF_QueryObject'

            property :object_name, :as => 'ObjectName', :attribute => true
            property :element, :as => 'SIF_Element'
          end
        end
      end
    end
  end
end
