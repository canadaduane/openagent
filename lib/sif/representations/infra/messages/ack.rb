module SIF
  module Representation
    module Infra
      module Message
        class Ack < SIF::Represent

          self.representation_wrap = 'SIF_Ack'

          property :original_source_id, :as => 'SIF_OriginalSourceId'
          property :original_msg_id,    :as => 'SIF_OriginalMsgId'

          property :header, :as => 'SIF_Header',
                   :class => SIF::Infra::Common::Header,
                   :decorator => Infra::Common::Header
          property :status, :as => 'SIF_Status',
                   :class => SIF::Infra::Common::Status,
                   :decorator => Infra::Common::Status
          property :error,  :as => 'SIF_Error',
                   :class => SIF::Infra::Common::Error,
                   :decorator => Infra::Common::Error
        end
      end
    end
  end
end
