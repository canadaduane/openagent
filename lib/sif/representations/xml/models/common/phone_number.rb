module SIF
  module Representation
    module XML
      module Model
        module Common
          class PhoneNumber < SIF::Representation

            self.representation_wrap = 'SIF_Address'

            property :type, :as => 'Type', :attribute => true
            property :action, :as => 'SIF_Action', :attribute => true
            property :number, :as => 'Number'
            property :extension, :as => 'Extension'
            property :listed_status, :as => 'ListedStatus'
          end
        end
      end
    end
  end
end