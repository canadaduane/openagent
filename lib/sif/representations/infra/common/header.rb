require_relative 'security'

module SIF
  module Representation
    module Infra
      module Common
        class Header < SIF::Represent

          self.representation_wrap = 'SIF_Header'

          property :msg_id,         :as => 'SIF_MsgId'
          property :timestamp,      :as => 'SIF_Timestamp'
          property :security,       :as => 'SIF_Security',
                   :class => SIF::Infra::Common::Security,
                   :decorator => Security
          property :source_id,      :as => 'SIF_SourceId'
          property :destination_id, :as => 'SIF_DestinationId'
          # collection :contexts, :class => XML::Context
        end
      end
    end
  end
end
