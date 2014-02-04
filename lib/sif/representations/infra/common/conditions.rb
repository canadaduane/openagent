module SIF
  module Representation
    module Infra
      module Common
        class Conditions < SIF::Represent

          self.representation_wrap = 'SIF_Conditions'

          property :type, :as => 'Type', :attribute => true

          collection :condition, :as => 'SIF_Condition',
                     :class => SIF::Infra::Common::Condition,
                     :decorator => Condition
        end
      end
    end
  end
end