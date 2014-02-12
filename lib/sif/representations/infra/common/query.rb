require_relative 'query_object'
require_relative 'condition_group'

module SIF
  module Representation
    module Infra
      module Common
        class Query < SIF::Represent

          self.representation_wrap = 'SIF_Query'

          property :query_object, :as => 'SIF_QueryObject',
                   :class => SIF::Infra::Common::QueryObject,
                   :decorator => QueryObject
          property :condition_group, :as => 'SIF_ConditionGroup',
                   :class => SIF::Infra::Common::ConditionGroup,
                   :decorator => ConditionGroup,
                   :if => lambda { !(condition_group || []).empty? }

          property :example, :as => 'SIF_Example'
        end
      end
    end
  end
end
