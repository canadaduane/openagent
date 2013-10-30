module SIF
  module Representation
    module XML
      class Event < Representable::Decorator
        include Representable::XML

        self.representation_wrap = 'SIF_Event'

        property :header, :as => :SIF_Header,
                 :class => SIF::Model::Header, :decorator => XML::Header
        property :object_data, :as => :SIF_ObjectData,
                 :class => SIF::Model::ObjectData, :decorator => XML::ObjectData
      end
    end
  end
end