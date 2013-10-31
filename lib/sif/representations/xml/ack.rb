module SIF
  module Representation
    module XML
      class Ack < Representable::Decorator
        include Representable::XML

        self.representation_wrap = 'SIF_Ack'

        property :original_source_id, :as => 'SIF_OriginalSourceId'
        property :original_msg_id,    :as => 'SIF_OriginalMsgId'

        property :header, :as => 'SIF_Header',
                 :class => SIF::Message::Header, :decorator => XML::Header
        property :status, :as => 'SIF_Status',
                 :class => SIF::Message::Status, :decorator => XML::Status
        property :error,  :as => 'SIF_Error',
                 :class => SIF::Message::Error,  :decorator => XML::Error
      end
    end
  end
end