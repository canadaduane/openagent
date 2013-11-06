module SIF
  module Infra
    module Message
      class Ping
        include Virtus.model

        attribute :ping, String
      end
    end
  end
end