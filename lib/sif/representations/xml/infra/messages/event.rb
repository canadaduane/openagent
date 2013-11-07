module SIF
  module Representation
    module XML
      module Infra
        module Message
          class Event < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_Event'

            property :header, :as => :SIF_Header,
                     :class => SIF::Infra::Common::Header,
                     :decorator => Header
            property :object_data, :as => :SIF_ObjectData,
                     :class => SIF::Infra::Common::ObjectData,
                     :decorator => ObjectData
          end
        end
      end
    end
  end
end
