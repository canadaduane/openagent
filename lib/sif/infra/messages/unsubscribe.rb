module SIF
  module Infra
    module Message
      class Unsubscribe
        include Virtus.model

        attribute :header, Common::Header
        attribute :object, Common::Object
      end
    end
  end
end