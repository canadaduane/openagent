module SIF
  module Infra
    module Message
      class Unsubscribe
        include Virtus.model

        attribute :header, Header
        attribute :object, Object
      end
    end
  end
end