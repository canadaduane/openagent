module SIF
  module Representation
    module XML
      class ConditionGroup < Representable::Decorator
        include Representable::XML

        self.representation_wrap = 'SIF_ConditionGroup'

        property :type, :as => 'Type', :attribute => true

        collection :conditions, :as => 'SIF_Conditions',
                   :class => SIF::Message::Condition, :decorator => XML::Condition
      end
    end
  end
end