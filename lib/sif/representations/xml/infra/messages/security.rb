module SIF
  module Representation
    module XML
      module Infra
        module Message
          class Security < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_Security'

            property :secure_channel, :as => :SIF_SecureChannel,
                     :class => SIF::Infra::Message::SecureChannel,
                     :decorator => SecureChannel
          end
        end
      end
    end
  end
end
