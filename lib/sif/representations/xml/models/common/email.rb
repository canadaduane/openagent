module SIF
  module Representation
    module XML
      module Model
        module Common
          class Email < SIF::Representation

            self.representation_wrap = 'Email'

            property :type, :as => 'Type', :attribute => true
            property :action, :as => 'SIF_Action', :attribute => true
            property :value, :content => true
          end
        end
      end
    end
  end
end