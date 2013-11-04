module SIF
  module Infra
    module Message
      class Protocol
        include Virtus.model

        attribute :type,       String
        attribute :secure,     String
        attribute :url,        String
        attribute :properties, Array[Property]
      end
    end
  end
end