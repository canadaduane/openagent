module SIF
  module Model
    class Event
      include Virtus.model

      attribute :header,      Header
      attribute :object_data, ObjectData
    end
  end
end
