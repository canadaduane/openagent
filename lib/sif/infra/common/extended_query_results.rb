module SIF
  module Infra
    module Common
      class ExtendedQueryResults
        include Virtus.model
        
        attribute :column_headers
        attribute :rows
      end
    end
  end
end