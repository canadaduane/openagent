module SIF
  module Representation
    module Model
      module Common
        module ExtendedElement
          include Representable::XML

          self.representation_wrap = 'SIF_ExtendedElement'

          property :name, :as => 'Name', :attribute => true
          property :value, :content => true

        end
      end
    end
  end
end