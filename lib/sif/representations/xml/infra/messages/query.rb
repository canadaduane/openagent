module SIF
  module Representation
    module XML
      module Infra
        module Message
          class Query < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_Query'

            property :query_object, :as => 'SIF_QueryObject',
                     :class => SIF::Infra::Message::QueryObject,
                     :decorator => QueryObject
            property :condition_group, :as => 'SIF_ConditionGroup',
                     :class => SIF::Infra::Message::ConditionGroup,
                     :decorator => ConditionGroup

            property :example, :as => 'SIF_Example'
          end
        end
      end
    end
  end
end
