module SIF
  module Representation
    module XML
      module Infra
        module Common
          class Query < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_Query'

            property :query_object, :as => 'SIF_QueryObject',
                     :class => SIF::Infra::Common::QueryObject,
                     :decorator => QueryObject
            property :condition_group, :as => 'SIF_ConditionGroup',
                     :class => SIF::Infra::Common::ConditionGroup,
                     :decorator => ConditionGroup

            property :example, :as => 'SIF_Example'
          end
        end
      end
    end
  end
end
