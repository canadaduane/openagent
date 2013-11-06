require_relative 'secure_channel'

module SIF
  module Infra
    module Common
      class Security
        include Virtus.model

        attribute :secure_channel, SecureChannel
      end
    end
  end
end