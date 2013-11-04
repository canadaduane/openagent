module SIF
  module Representation
    module XML
      class Object < Representable::Decorator
        include Representable::XML

        self.representation_wrap = 'SIF_Object'

        property :object_name, :attribute => true, :as => :ObjectName
      end
    end
  end
end