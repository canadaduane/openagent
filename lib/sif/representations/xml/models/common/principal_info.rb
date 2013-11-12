module SIF
  module Representation
    module XML
      module Model
        module Common
          class PrincipalInfo < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'PrincipalInfo'

            property :contact_name, :as => 'ContactName'
            property :contact_title, :as => 'ContactTitle'
          end
        end
      end
    end
  end
end