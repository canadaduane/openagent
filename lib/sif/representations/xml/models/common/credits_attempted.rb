module SIF
  module Representation
    module XML
      module Model
        module Common
          class CreditsAttempted < SIF::Representation

            self.representation_wrap = 'CreditsAttempted'

            property :type, :as => 'Type', :attribute => true
            property :value, :content => true
          end
        end
      end
    end
  end
end