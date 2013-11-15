module SIF
  module Representation
    module Model
      module Common
        class EnglishProficiency < SIF::Represent

          self.representation_wrap = 'EnglishProficiency'

          property :code, :as => 'Code'
          collection :other_codes, :as => 'OtherCode', :wrap => 'OtherCodeList',
                   :class => MODEL_COMMON::OtherCode,
                   :decorator => REPR_COMMON::OtherCode
        end
      end
    end
  end
end
