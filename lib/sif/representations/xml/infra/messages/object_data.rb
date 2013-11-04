module SIF
  module Representation
    module XML
      module Infra
        module Message
          class ObjectData < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_ObjectData'

            property :event_object, :as => 'SIF_EventObject',
                     :class => SIF::Infra::Message::EventObject,
                     :decorator => EventObject

            collection :objects, :as => 'StudentPersonal',
                       :class => SIF::Model::Group::SIS::StudentPersonal,
                       :decorator => XML::Model::Group::SIS::StudentPersonal
          end
        end
      end
    end
  end
end