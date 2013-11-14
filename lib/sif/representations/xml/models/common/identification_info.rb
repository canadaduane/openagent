module SIF
  module Representation
    module XML
      module Model
        module Common
          class IdentificationInfo < SIF::Representation

            self.representation_wrap = 'IdentificationInfo'

            property :value, :content => true
            property :code, :as => 'Code', :attribute => true

          end
        end
      end
    end
  end
end