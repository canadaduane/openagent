module SIF
  module Representation
    module Model
      module Common
        class AlertMessage < SIF::Represent

          self.representation_wrap = 'AlertMessage'

          property :type, :as => 'Type', :attribute => true
          property :value, :content => true

        end
      end
    end
  end
end
