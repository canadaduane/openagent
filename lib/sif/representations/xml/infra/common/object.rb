module SIF
  module Representation
    module XML
      module Infra
        module Common
          class Object < SIF::Representation

            self.representation_wrap = 'SIF_Object'

            property :object_name, :attribute => true, :as => 'ObjectName'
          end
        end
      end
    end
  end
end