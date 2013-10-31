module SIF
  module Representation
    module XML
      class Request < Representable::Decorator
        include Representable::XML

        self.representation_wrap = 'SIF_Error'

        property :header, :as => 'SIF_Header',
                 :class => SIF::Message::Header, :decorator => XML::Header
        property :query, :as => 'SIF_Query',
                 :class => SIF::Message::Query, :decorator => XML::Query
        property :extended_query,  :as => 'SIF_ExtendedQuery',
                 :class => SIF::Message::ExtendedQuery,  :decorator => XML::ExtendedQuery

        property :version, :as => 'SIF_Version'
        property :max_buffer_size, :as => 'SIF_MaxBufferSize'
      end
    end
  end
end