module SIF
  module Representation
    module Model
      module Common
        class Email < SIF::Represent

          self.representation_wrap = 'Email'

          property :type, :as => 'Type', :attribute => true
          property :action, :as => 'SIF_Action', :attribute => true
          property :value, :content => true
        end
      end
    end
  end
end
