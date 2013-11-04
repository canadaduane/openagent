module SIF
  module Infra
    module Message
      class Application
        include Virtus.model

        attribute :vendor,  String
        attribute :product, String
        attribute :version, String
      end
    end
  end
end