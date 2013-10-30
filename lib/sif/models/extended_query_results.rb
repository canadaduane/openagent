module SIF
  module Model
    class ExtendedQueryResults
      include Virtus.model
      
      attr_accessor :column_headers
      attr_accessor :rows
    end
  end
end
