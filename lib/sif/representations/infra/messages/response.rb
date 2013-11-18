module SIF
  module Representation
    module Infra
      module Message
        class Response < SIF::Represent

          self.representation_wrap = 'SIF_Response'

          property :header, :as => 'SIF_Header',
                   :class => SIF::Infra::Common::Header,
                   :decorator => Infra::Common::Header
          property :error,  :as => 'SIF_Error',
                   :class => SIF::Infra::Common::Error,
                   :decorator => Infra::Common::Error
          property :object_data, :as => 'SIF_ObjectData',
                   :class => SIF::Infra::Common::ObjectData,
                   :decorator => Infra::Common::ObjectData
          property :extended_query_results, :as => 'SIF_ExtendedQueryResults',
                   :class => SIF::Infra::Common::ExtendedQueryResults,
                   :decorator => Infra::Common::ExtendedQueryResults

          property :request_msg_id, :as => 'SIF_RequestMsgId'
          property :packet_number,  :as => 'SIF_PacketNumber'
          property :more_packets, :as => 'SIF_MorePackets'
        end
      end
    end
  end
end
