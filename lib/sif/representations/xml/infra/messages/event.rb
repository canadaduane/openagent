module SIF
  module Representation
    module XML
      module Infra
        module Message
          class Event < SIF::Representation

            self.representation_wrap = 'SIF_Event'

            property :header, :as => :SIF_Header,
                     :class => SIF::Infra::Common::Header,
                     :decorator => XML::Infra::Common::Header
            property :object_data, :as => :SIF_ObjectData,
                     :class => SIF::Infra::Common::ObjectData,
                     :decorator => XML::Infra::Common::ObjectData
          end
        end
      end
    end
  end
end
