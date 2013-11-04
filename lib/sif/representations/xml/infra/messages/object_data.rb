module SIF
  module Representation
    module XML
      class ObjectData < Representable::Decorator
        include Representable::XML

        self.representation_wrap = 'SIF_ObjectData'

        property :event_object, :as => 'SIF_EventObject',
                 :class => SIF::Message::EventObject, :decorator => XML::EventObject

        collection :objects, :as => 'StudentPersonal',
                   :class => SIF::Model::StudentPersonal, :decorator => XML::StudentPersonal
      end
    end
  end
end