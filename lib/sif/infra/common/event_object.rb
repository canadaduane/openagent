module SIF
  module Infra
    module Common
      class EventObject
        include Virtus.model

        attribute :object_name, String
        attribute :action,      String
      end
    end
  end
end