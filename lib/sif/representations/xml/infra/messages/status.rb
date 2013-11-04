module SIF
  module Representation
    module XML
      module Infra
        module Message
          class Status < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_Status'

            property :code, :as => 'SIF_Code'
            property :desc, :as => 'SIF_Desc'
            property :data, :as => 'SIF_Data',
                     :class => SIF::Infra::Message::Data,
                     :decorator => Data
          end
        end
      end
    end
  end
end
