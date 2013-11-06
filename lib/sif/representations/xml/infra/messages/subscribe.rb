module SIF
  module Representation
    module XML
      module Infra
        module Message
          class Subscribe < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_Subscribe'

            property :header, :as => :SIF_Header,
                     :class => SIF::Infra::Message::Header, :decorator => Header
            property :object, :as => :SIF_Object,
                     :class => SIF::Infra::Message::Object, :decorator => Object
          end
        end
      end
    end
  end
end
