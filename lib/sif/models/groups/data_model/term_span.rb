module SIF
  module Model
    module Group
      module DataModel
        class TermSpan
          include Virtus.model

          attribute :code
          attribute :other_codes, Array[MODEL_COMMON::OtherCode]
        end
      end
    end
  end
end