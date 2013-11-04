module SIF
  module Representation
    module XML
      class OtherId < Representable::Decorator
        include Representable::XML

        self.representation_wrap = 'SIF_OtherId'

        property :type, :attribute => true, :as => 'Type'
        property :value
      end
    end
  end
end