module SIF
  module Representation
    module XML
      module Model
        module Common
          class Language < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_Error'

            property :code, :as => 'Code'
            property :language_type, :as => 'LanguageType'
            property :dialect, :as => 'Dialect'
            collection :other_codes, :wrap => 'OtherCodeList'
          end
        end
      end
    end
  end
end
