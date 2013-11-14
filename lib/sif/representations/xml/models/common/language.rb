module SIF
  module Representation
    module XML
      module Model
        module Common
          class Language < SIF::Representation

            self.representation_wrap = 'SIF_Error'

            property :code, :as => 'Code'
            property :language_type, :as => 'LanguageType'
            property :dialect, :as => 'Dialect'
            collection :other_codes, :wrap => 'OtherCodeList',
                       :class => MODEL_COMMON::OtherCode,
                       :decorator => XML_COMMON::OtherCode
          end
        end
      end
    end
  end
end
