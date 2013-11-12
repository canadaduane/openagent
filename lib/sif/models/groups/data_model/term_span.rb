module SIF
  module Model
    module Group
      module DataModel
        class TermSpan
          include Virtus.model

          attribute :code
          attribute :other_codes
        end
      end
    end
  end
end