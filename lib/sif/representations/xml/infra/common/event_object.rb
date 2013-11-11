module SIF
  module Representation
    module XML
      module Infra
        module Common
          class EventObject < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_EventObject'

            property :object_name, :as => "ObjectName", :attribute => true
            property :action, :as => "Action", :attribute => true
          end
        end
      end
    end
  end
end