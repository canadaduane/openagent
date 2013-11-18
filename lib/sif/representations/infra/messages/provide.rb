module SIF
  module Representation
    module Infra
      module Message
        class Provide < SIF::Represent

          self.representation_wrap = 'SIF_Provide'

          property :header, :as => :SIF_Header,
                   :class => SIF::Infra::Common::Header,
                   :decorator => Infra::Common::Header
          collection :objects, :as => :SIF_Object,
                     :class => SIF::Infra::Common::Object,
                     :decorator => Infra::Common::Object
        end
      end
    end
  end
end
