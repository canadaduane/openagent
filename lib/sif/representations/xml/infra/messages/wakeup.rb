module SIF
  module Representation
    module XML
      module Infra
        module Message
          class Wakeup < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_Wakeup'

            property :wakeup, :as => 'SIF_Wakeup'
          end
        end
      end
    end
  end
end
