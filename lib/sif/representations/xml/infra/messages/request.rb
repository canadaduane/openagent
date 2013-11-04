module SIF
  module Representation
    module XML
      module Infra
        module Message
          class Request < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_Error'

            property :header, :as => 'SIF_Header',
                     :class => SIF::Infra::Message::Header,
                     :decorator => Header
            property :query, :as => 'SIF_Query',
                     :class => SIF::Infra::Message::Query,
                     :decorator => Query
            property :extended_query,  :as => 'SIF_ExtendedQuery',
                     :class => SIF::Infra::Message::ExtendedQuery,
                     :decorator => ExtendedQuery

            property :version, :as => 'SIF_Version'
            property :max_buffer_size, :as => 'SIF_MaxBufferSize'
          end
        end
      end
    end
  end
end
