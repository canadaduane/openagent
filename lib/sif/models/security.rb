module SIF
  module Model
    class Security
      include Virtus.model

      attribute :secure_channel, SecureChannel
    end
  end
end
