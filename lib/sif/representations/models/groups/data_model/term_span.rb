module SIF
  module Representation
    module Model
      module Group
        module DataModel
          class TermSpan < Representable::Decorator
            self.representation_wrap = 'TermSpan'

            collection :other_codes, :as => 'OtherCode', :wrap => 'OtherCodeList',
                       :class => MODEL_COMMON::OtherCode,
                       :decorator => REPR_COMMON::OtherCode

            property :code, :as => 'Code'

          end
        end
      end
    end
  end
end
