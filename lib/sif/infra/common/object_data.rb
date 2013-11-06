require_relative 'event_object'

module SIF
  module Infra
    module Common
      class ObjectData
        include Virtus.model

        attribute :event_object, EventObject
        attribute :objects
      end
    end
  end
end