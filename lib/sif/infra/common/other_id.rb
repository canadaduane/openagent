module SIF
  module Infra
    module Common
      class OtherId
        include Virtus.model

        attribute :type, String
        attribute :value, String
      end
    end
  end
end