module SIF
  module Representation
    module XML
      module Model
        module Common
          class MedicalAlertMessage < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'MedicalAlertMessage'

            property :type, :attribute => true, :as => 'Type'
            property :value, :content => true
          end
        end
      end
    end
  end
end
