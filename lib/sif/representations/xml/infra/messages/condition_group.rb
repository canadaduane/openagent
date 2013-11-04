module SIF
  module Representation
    module XML
      module Infra
        module Message
          class ConditionGroup < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_ConditionGroup'

            property :type, :as => 'Type', :attribute => true

            collection :conditions, :as => 'SIF_Conditions',
                       :class => SIF::Infra::Message::Condition,
                       :decorator => Condition
          end
        end
      end
    end
  end
end
