module SIF
  module Infra
    module Message
      class Unregister
        include Virtus.model

        attribute :header, Common::Header
      end
    end
  end
end