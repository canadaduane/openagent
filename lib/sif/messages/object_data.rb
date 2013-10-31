module SIF
  module Message
    class ObjectData
      include Virtus.model

      attribute :event_object, EventObject
      attribute :objects
    end
  end
end
