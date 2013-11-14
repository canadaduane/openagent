module SIF
  module Representation
    module XML
      module Infra
        module Common
          class Status < SIF::Representation

            self.representation_wrap = 'SIF_Status'

            property :code, :as => 'SIF_Code'
            property :desc, :as => 'SIF_Desc'
            property :data, :as => 'SIF_Data',
                     :class => SIF::Infra::Common::Data,
                     :decorator => Data
          end
        end
      end
    end
  end
end
