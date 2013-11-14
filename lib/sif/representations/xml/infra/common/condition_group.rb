module SIF
  module Representation
    module XML
      module Infra
        module Common
          class ConditionGroup < SIF::Representation

            self.representation_wrap = 'SIF_ConditionGroup'

            property :type, :as => 'Type', :attribute => true

            collection :conditions, :as => 'SIF_Conditions',
                       :class => SIF::Infra::Common::Condition,
                       :decorator => Condition
          end
        end
      end
    end
  end
end
