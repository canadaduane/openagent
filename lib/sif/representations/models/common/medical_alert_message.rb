module SIF
  module Representation
    module Model
      module Common
        class MedicalAlertMessage < SIF::Represent

          self.representation_wrap = 'MedicalAlertMessage'

          property :type, :attribute => true, :as => 'Type'
          property :value, :content => true
        end
      end
    end
  end
end
