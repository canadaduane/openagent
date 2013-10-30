module SIF
  module Representation
    module XML
      class Header < Representable::Decorator
        include Representable::XML

        self.representation_wrap = 'SIF_Header'

        property :msg_id,         :as => 'SIF_MsgId'
        property :timestamp,      :as => 'SIF_Timestamp'
        property :security,       :as => 'SIF_Security',
                 :class => SIF::Model::Security, :decorator => XML::Security
        property :source_id,      :as => 'SIF_SourceId'
        property :destination_id, :as => 'SIF_DestinationId'
        # collection :contexts, :class => XML::Context
      end
    end
  end
end