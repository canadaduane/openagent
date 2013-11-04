module SIF
  module Representation
    module XML
      class QueryObject < Representable::Decorator
        include Representable::XML

        self.representation_wrap = 'SIF_Query'

        property :object_name, :as => 'ObjectName', :attribute => true
        property :element, :as => 'SIF_Element'
      end
    end
  end
end