module SIF
  module Representation
    module XML
      module Model
        module Common
          class Race < Representable::Decorator
            require_relative 'other_code'

            include Representable::XML

            self.representation_wrap = 'Race'

            property :code, :as => 'Code'
            collection :other_codes, :as => 'OtherCode', :wrap => 'OtherCodeList',
                       :class => MODEL_COMMON::OtherCode,
                       :decorator => XML_COMMON::OtherCode
            property :proportion, :as => 'Proportion'
          end
        end
      end
    end
  end
end