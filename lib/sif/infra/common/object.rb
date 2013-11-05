module SIF
  module Infra
    module Common
      class Object
        include Virtus.model

        attribute :object_name, String
      end
    end
  end
end