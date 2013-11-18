module SIF
  module Representation
    module Infra
      module Message
        class Request < SIF::Represent

          self.representation_wrap = 'SIF_Request'

          property :header, :as => 'SIF_Header',
                   :class => SIF::Infra::Common::Header,
                   :decorator => Infra::Common::Header
          property :version, :as => 'SIF_Version'
          property :max_buffer_size, :as => 'SIF_MaxBufferSize'
          property :query, :as => 'SIF_Query',
                   :class => SIF::Infra::Common::Query,
                   :decorator => Infra::Common::Query
          property :extended_query,  :as => 'SIF_ExtendedQuery',
                   :class => SIF::Infra::Common::ExtendedQuery,
                   :decorator => Infra::Common::ExtendedQuery
        end
      end
    end
  end
end
