module SIF
  module Infra
    module Message
      class Condition
        include Virtus.model

        attribute :element,  String
        attribute :operator, String
        attribute :value,    String
      end
    end
  end
end