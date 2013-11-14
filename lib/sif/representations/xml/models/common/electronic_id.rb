module SIF
  module Representation
    module XML
      module Model
        module Common
          class ElectronicId < SIF::Represent

            self.representation_wrap = 'ElectronicId'

            property :type, :as => 'Type', :attribute => true
            property :value, :content => true

          end
        end
      end
    end
  end
end
