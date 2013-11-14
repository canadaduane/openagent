module SIF
  module Representation
    module XML
      module Infra
        module Common
          class Error < SIF::Representation

            self.representation_wrap = 'SIF_Error'

            property :category, :as => 'SIF_Category'
            property :code, :as => 'SIF_Code'
            property :desc, :as => 'SIF_Desc'
            property :extended_desc, :as => 'SIF_ExtendedDesc'
          end
        end
      end
    end
  end
end
