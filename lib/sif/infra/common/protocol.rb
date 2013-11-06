require_relative 'property'

module SIF
  module Infra
    module Common
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