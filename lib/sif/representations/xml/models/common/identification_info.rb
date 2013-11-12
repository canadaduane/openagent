module SIF
  module Representation
    module XML
      module Model
        module Common
          class IdentificationInfo < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'IdentificationInfo'

            property :value
            property :code , :as => 'Code', :attribute => true

          end
        end
      end
    end
  end
end