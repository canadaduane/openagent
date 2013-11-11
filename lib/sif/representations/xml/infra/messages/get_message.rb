module SIF
  module Representation
    module XML
      module Infra
        module Message
          class GetMessage < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_GetMessage'
          end
        end
      end
    end
  end
end