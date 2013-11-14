require_relative 'event_object'

require 'sif/representations/xml/models'

module SIF
  module Representation
    module XML
      module Infra
        module Common
          class ObjectData < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_ObjectData'

            property :event_object, :as => 'SIF_EventObject',
                     :class => SIF::Infra::Common::EventObject,
                     :decorator => EventObject

            collection :objects, :as => 'StudentPersonal',
                       :class => SIF::Model::Group::SIS::StudentPersonal,
                       :decorator => XML::Model::Group::SIS::StudentPersonal
            # collection :objects, :as => 'LEAInfo',
            #            :class => SIF::Model::Group::SIS::LEAInfo,
            #            :decorator => XML::Model::Group::SIS::LEAInfo
          end
        end
      end
    end
  end
end