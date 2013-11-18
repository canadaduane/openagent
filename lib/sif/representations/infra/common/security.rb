require_relative 'secure_channel'

module SIF
  module Representation
    module Infra
      module Common
        class Security < SIF::Represent

          self.representation_wrap = 'SIF_Security'

          property :secure_channel, :as => :SIF_SecureChannel,
                   :class => SIF::Infra::Common::SecureChannel,
                   :decorator => SecureChannel
        end
      end
    end
  end
end
