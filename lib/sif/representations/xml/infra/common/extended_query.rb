module SIF
  module Representation
    module XML
      module Infra
        module Common
          class ExtendedQuery < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_ExtendedQuery'

            property :destination_provider, :as => 'SIF_DestinationProvider'
            property :select, :as => 'SIF_Select'
            property :from, :as => 'SIF_From'
            property :where, :as => 'SIF_Where'
            property :order_by, :as => 'SIF_OrderBy'
          end
        end
      end
    end
  end
end
