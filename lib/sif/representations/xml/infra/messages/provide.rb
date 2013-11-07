module SIF
  module Representation
    module XML
      module Infra
        module Message
          class Provide < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_Provide'

            property :header, :as => :SIF_Header,
                     :class => SIF::Infra::Common::Header,
                     :decorator => XML::Infra::Common::Header
            collection :objects, :as => :SIF_Object,
                       :class => SIF::Infra::Common::Object,
                       :decorator => XML::Infra::Common::Object
          end
        end
      end
    end
  end
end
