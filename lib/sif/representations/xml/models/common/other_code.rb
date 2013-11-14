module SIF
  module Representation
    module XML
      module Model
        module Common
          class OtherCode < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'OtherCode'

            property :code_set, :as => 'Codeset', :attribute => true
            property :value, :content => true
          end
        end
      end
    end
  end
end