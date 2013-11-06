module SIF
  module Infra
    module Common
      class ExtendedQuery
        include Virtus.model

        attribute :destination_provider
        attribute :select
        attribute :from
        attribute :where
        attribute :order_by
      end
    end
  end
end