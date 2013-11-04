module SIF
  module Infra
    module Message
      class Subscribe
        include Virtus.model

        attribute :header, Header
        attribute :object, Object
      end
    end
  end
end