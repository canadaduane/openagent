module SIF
  module Representation
    module XML
      module Infra
        module Common
          class OtherId < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_OtherId'

            property :type, :attribute => true, :as => 'Type'
            property :value, :as => 'SIF_OtherId'
          end
        end
      end
    end
  end
end