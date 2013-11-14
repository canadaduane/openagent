module SIF
  module Representation
    module XML
      module Infra
        module Common
          class Property < SIF::Representation

            self.representation_wrap = 'SIF_Property'

            property :name,  :as => 'SIF_Name'
            property :value, :as => 'SIF_Value'
          end
        end
      end
    end
  end
end