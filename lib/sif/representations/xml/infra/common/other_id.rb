module SIF
  module Representation
    module XML
      module Infra
        module Common
          class OtherId < SIF::Represent

            self.representation_wrap = 'SIF_OtherId'

            property :type,  :as => 'Type', :attribute => true
            property :value, :content => true
          end
        end
      end
    end
  end
end