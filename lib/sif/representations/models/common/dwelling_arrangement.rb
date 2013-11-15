module SIF
  module Representation
    module Model
      module Common
        class DwellingArrangement < SIF::Represent
          require_relative 'other_code'

          self.representation_wrap = 'DwellingArrangement'

          property :code, :as => 'Code'
          collection :other_codes, :as => 'OtherCode', :wrap => 'OtherCodeList',
                   :class => MODEL_COMMON::OtherCode,
                   :decorator => REPR_COMMON::OtherCode
        end
      end
    end
  end
end
