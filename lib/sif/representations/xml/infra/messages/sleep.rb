module SIF
  module Representation
    module XML
      module Infra
        module Message
          class Sleep < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_Sleep'

            property :sleep, :as => 'SIF_Sleep'
          end
        end
      end
    end
  end
end
