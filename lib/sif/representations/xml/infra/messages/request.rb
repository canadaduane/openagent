module SIF
  module Representation
    module XML
      module Infra
        module Message
          class Request < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_Error'

            property :header, :as => 'SIF_Header',
                     :class => SIF::Infra::Common::Header,
                     :decorator => XML::Infra::Common::Header
            property :query, :as => 'SIF_Query',
                     :class => SIF::Infra::Common::Query,
                     :decorator => XML::Infra::Common::Query
            property :extended_query,  :as => 'SIF_ExtendedQuery',
                     :class => SIF::Infra::Common::ExtendedQuery,
                     :decorator => XML::Infra::Common::ExtendedQuery

            property :version, :as => 'SIF_Version'
            property :max_buffer_size, :as => 'SIF_MaxBufferSize'
          end
        end
      end
    end
  end
end
