module SIF
  module Representation
    module XML
      module Model
        module Common
          class AlertMessage < SIF::Representation

            self.representation_wrap = 'AlertMessage'

            property :type, :as => 'Type', :attribute => true
            property :value, :content => true

          end
        end
      end
    end
  end
end