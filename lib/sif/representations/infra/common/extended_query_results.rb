module SIF
  module Representation
    module Infra
      module Common
        class ExtendedQueryResults < SIF::Represent

          self.representation_wrap = 'SIF_ExtendedQueryResults'

          property :column_headers, :as => 'SIF_ColumnHeaders'
          property :rows, :as => 'SIF_Rows'
        end
      end
    end
  end
end
