module SIF
  module Representation
    module Model
      module Common
        class OtherId < SIF::Represent

          self.representation_wrap = 'OtherId'

          property :type, :as => "Type", :attribute => true
          property :value, :content => true
        end
      end
    end
  end
end
