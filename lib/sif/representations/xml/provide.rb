module SIF
  module Representation
    module XML
      class Provide < Representable::Decorator
        include Representable::XML

        self.representation_wrap = 'SIF_Provide'

        property :header, :as => :SIF_Header,
                 :class => SIF::Model::Header, :decorator => XML::Header
        collection :objects, :as => :SIF_Object,
                   :class => SIF::Model::Object, :decorator => XML::Object
      end
    end
  end
end