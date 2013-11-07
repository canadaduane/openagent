module SIF
  module Representation
    module XML
      module Model
        module Common
          class MedicalAlertMessage < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_MedicalAlertMessage'

            property :type, :attribute => true, :as => 'Type'
            property :value
          end
        end
      end
    end
  end
end
