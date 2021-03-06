module SIF
  module Infra
    module Common
      class SecureChannel
        include Virtus.model

        attribute :authentication_level, Integer
        attribute :encryption_level,     Integer
      end
    end
  end
end