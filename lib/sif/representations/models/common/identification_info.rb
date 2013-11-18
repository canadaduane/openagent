module SIF
  module Representation
    module Model
      module Common
        class IdentificationInfo < SIF::Represent

          self.representation_wrap = 'IdentificationInfo'

          property :value, :content => true
          property :code, :as => 'Code', :attribute => true

        end
      end
    end
  end
end
