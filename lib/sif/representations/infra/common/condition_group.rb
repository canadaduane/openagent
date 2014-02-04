module SIF
  module Representation
    module Infra
      module Common
        class ConditionGroup < SIF::Represent

          self.representation_wrap = 'SIF_ConditionGroup'

          property :type, :as => 'Type', :attribute => true

          collection :conditions, :as => 'SIF_Conditions',
                     :class => SIF::Infra::Common::Conditions,
                     :decorator => Conditions

        end
      end
    end
  end
end
