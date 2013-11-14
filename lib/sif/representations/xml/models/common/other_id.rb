module SIF
  module Representation
    module XML
      module Model
        module Common
          class OtherId < SIF::Representation

            self.representation_wrap = 'OtherId'

            property :type, :as => "Type", :attribute => true
            property :value, :content => true
          end
        end
      end
    end
  end
end