module SIF
  module Representation
    module XML
      module Infra
        module Message
          class Ping < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_Ping'

            property :ping, :as => 'SIF_Ping'
          end
        end
      end
    end
  end
end
