module SIF
  module Representation
    module XML
      class Data < Representable::Decorator
        include Representable::XML

        self.representation_wrap = 'SIF_Data'

        property :message, :as => 'SIF_Message',
                 :class => SIF::Message::Message, :decorator => XML::Message
      end
    end
  end
end