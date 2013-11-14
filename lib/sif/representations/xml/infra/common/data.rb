module SIF
  module Representation
    module XML
      module Infra
        module Common
          class Message < Representable::Decorator; end
          class Data < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_Data'

            property :message, :as => 'SIF_Message',
                     :class => SIF::Infra::Common::Message,
                     :decorator => Message
          end
        end
      end
    end
  end
end