module SIF
  module Infra
    module Common
      class Condition
        include Virtus.model

        attribute :element,  String
        attribute :operator, String
        attribute :value,    String
      end
    end
  end
end