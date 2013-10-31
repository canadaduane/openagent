module SIF
  module Representation
    module XML
      class Security < Representable::Decorator
        include Representable::XML

        self.representation_wrap = 'SIF_Security'

        property :secure_channel, :as => :SIF_SecureChannel,
                 :class => SIF::Message::SecureChannel, :decorator => XML::SecureChannel
      end
    end
  end
end