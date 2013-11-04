module SIF
  module Representation
    module XML
      class Event < Representable::Decorator
        include Representable::XML

        self.representation_wrap = 'SIF_Event'

        property :header, :as => :SIF_Header,
                 :class => SIF::Message::Header, :decorator => XML::Header
        property :object_data, :as => :SIF_ObjectData,
                 :class => SIF::Message::ObjectData, :decorator => XML::ObjectData
      end
    end
  end
end