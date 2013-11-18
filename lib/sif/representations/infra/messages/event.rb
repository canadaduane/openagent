module SIF
  module Representation
    module Infra
      module Message
        class Event < SIF::Represent

          self.representation_wrap = 'SIF_Event'

          property :header, :as => :SIF_Header,
                   :class => SIF::Infra::Common::Header,
                   :decorator => Infra::Common::Header
          property :object_data, :as => :SIF_ObjectData,
                   :class => SIF::Infra::Common::ObjectData,
                   :decorator => Infra::Common::ObjectData
        end
      end
    end
  end
end
