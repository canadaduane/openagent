module SIF
  module Infra
    module Message
      class Security
        include Virtus.model

        attribute :secure_channel, SecureChannel
      end
    end
  end
end