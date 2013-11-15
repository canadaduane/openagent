module SIF
  module Representation
    module Infra
      module Common
        class ExtendedQuery < SIF::Represent

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
