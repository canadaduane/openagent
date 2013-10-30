module SIF
  module Model
    class ObjectData
      include Virtus.model

      attribute :event_object, EventObject
    end
  end
end
