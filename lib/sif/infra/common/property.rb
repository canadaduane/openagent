module SIF
  module Infra
    module Common
      class Property
        include Virtus.model

        attribute :name,  String
        attribute :value, String
      end
    end
  end
end