module SIF
  module Representation
    module Infra
      module Common
        class Property < SIF::Represent

          self.representation_wrap = 'SIF_Property'

          property :name,  :as => 'SIF_Name'
          property :value, :as => 'SIF_Value'
        end
      end
    end
  end
end
