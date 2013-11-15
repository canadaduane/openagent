module SIF
  module Representation
    module Infra
      module Message
        class Subscribe < SIF::Represent

          self.representation_wrap = 'SIF_Subscribe'

          property :header, :as => :SIF_Header,
                   :class => SIF::Infra::Common::Header,
                   :decorator => Infra::Common::Header
          property :object, :as => :SIF_Object,
                   :class => SIF::Infra::Common::Object,
                   :decorator => Infra::Common::Object
        end
      end
    end
  end
end
