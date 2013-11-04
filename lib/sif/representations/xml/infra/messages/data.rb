module SIF
  module Representation
    module XML
      module Infra
        module Message
          class Data < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_Data'

            property :message, :as => 'SIF_Message',
                     :class => SIF::Infra::Message::Message,
                     :decorator => Message
          end
        end
      end
    end
  end
end