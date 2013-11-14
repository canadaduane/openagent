module SIF
  module Representation
    module XML
      module Infra
        module Common
          class Application < SIF::Representation

            self.representation_wrap = 'SIF_Application'

            property :vendor, :as => 'SIF_Vendor'
            property :product, :as => 'SIF_Product'
            property :version, :as => 'SIF_Version'
          end
        end
      end
    end
  end
end
