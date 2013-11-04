module SIF
  module Model
    module Common
      class OtherId
        include Virtus.model

        attribute :type, String
        attribute :value, Street
      end
    end
  end
end