module SIF
  module Representation
    module Model
      module Common
        class Race < SIF::Represent

          self.representation_wrap = 'Race'

          property :code, :as => 'Code'
          collection :other_codes, :as => 'OtherCode', :wrap => 'OtherCodeList',
                     :class => MODEL_COMMON::OtherCode,
                     :decorator => REPR_COMMON::OtherCode
          property :proportion, :as => 'Proportion'
        end
      end
    end
  end
end
