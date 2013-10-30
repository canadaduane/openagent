module SIF
  module Model
    class EventObject
      include Virtus.model

      attribute :object_name, String
      attribute :action,      String
    end
  end
end
