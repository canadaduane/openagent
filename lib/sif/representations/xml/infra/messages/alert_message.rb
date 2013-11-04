module SIF
  module Representation
    module XML
      class AlertMessage < Representable::Decorator
        include Representable::XML

        self.representation_wrap = 'SIF_AlertMessage'

        property :type, :attribute => true, :as => 'Type'
        property :value
      end
    end
  end
end