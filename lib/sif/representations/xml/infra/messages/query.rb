module SIF
  module Representation
    module XML
      class Query < Representable::Decorator
        include Representable::XML

        self.representation_wrap = 'SIF_Query'

        property :query_object, :as => 'SIF_QueryObject',
                 :class => SIF::Message::QueryObject, :decorator => XML::QueryObject
        property :condition_group, :as => 'SIF_ConditionGroup',
                 :class => SIF::Message::ConditionGroup, :decorator => XML::ConditionGroup

        property :example, :as => 'SIF_Example'
      end
    end
  end
end