module SIF
  module Infra
    module Message
      class Unregister
        include Virtus.model

        attribute :header, Header
      end
    end
  end
end