module SIF
  module Infra
    module Message
      class ExtendedQueryResults
        include Virtus.model
        
        attr_accessor :column_headers
        attr_accessor :rows
      end
    end
  end
end