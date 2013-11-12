module SIF
  module Representation
    module XML
      module Model
        module Common
          class OtherCode < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'OtherCode'

            property :value
            property :code_set, :as => 'Codeset', :attribute => true
          end
        end
      end
    end
  end
end