module SIF
  module Representation
    module Infra
      module Common
        class Object < SIF::Represent

          self.representation_wrap = 'SIF_Object'

          property :object_name, :attribute => true, :as => 'ObjectName'
        end
      end
    end
  end
end
