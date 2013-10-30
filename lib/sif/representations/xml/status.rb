module SIF
  module Representation
    module XML
      class Status < Representable::Decorator
        include Representable::XML

        self.representation_wrap = 'SIF_Status'

        property :code, :as => 'SIF_Code'
        property :desc, :as => 'SIF_Desc'
        property :data, :as => 'SIF_Data',
                 :class => SIF::Model::Data, :decorator => XML::Data
      end
    end
  end
end