module SIF
  module Representation
    module Model
      module Common
        class OtherCode < SIF::Represent

          self.representation_wrap = 'OtherCode'

          property :code_set, :as => 'Codeset', :attribute => true
          property :value, :content => true
        end
      end
    end
  end
end
