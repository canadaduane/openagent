module SIF
  module Representation
    module XML
      module Infra
        module Message
          class Ack < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_Ack'

            property :original_source_id, :as => 'SIF_OriginalSourceId'
            property :original_msg_id,    :as => 'SIF_OriginalMsgId'

            property :header, :as => 'SIF_Header',
                     :class => SIF::Infra::Message::Header, :decorator => Header
            property :status, :as => 'SIF_Status',
                     :class => SIF::Infra::Message::Status, :decorator => Status
            property :error,  :as => 'SIF_Error',
                     :class => SIF::Infra::Message::Error,  :decorator => Error
          end
        end
      end
    end
  end
end