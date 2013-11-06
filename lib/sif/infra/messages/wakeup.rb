module SIF
  module Infra
    module Message
      class Wakeup
        include Virtus.model

        attribute :wakeup, String
      end
    end
  end
end