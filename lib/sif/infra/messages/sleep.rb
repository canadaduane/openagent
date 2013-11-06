module SIF
  module Infra
    module Message
      class Sleep
        include Virtus.model

        attribute :sleep, String
      end
    end
  end
end