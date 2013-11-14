module SIF
  module Model
    module Common
      class OtherId
        include Virtus.model

        attribute :type, String
        attribute :value, String
      end
    end
  end
end