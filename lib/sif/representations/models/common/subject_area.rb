module SIF
  module Representation
    module Model
      module Common
        class SubjectArea < SIF::Represent

          self.representation_wrap = 'SubjectArea'

          property :code, :as => 'Code'
          collection :other_codes, :as => 'OtherCode', :wrap => 'OtherCodeList',
                     :class => MODEL_COMMON::OtherCode,
                     :decorator => REPR_COMMON::OtherCode
        end
      end
    end
  end
end
