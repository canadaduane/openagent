module SIF
  module Representation
    module XML
      module Infra
        module Message
          class Property < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_Property'

            property :name,  :as => 'SIF_Name'
            property :value, :as => 'SIF_Value'
          end
        end
      end
    end
  end
end