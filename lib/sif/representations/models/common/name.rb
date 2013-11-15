module SIF
  module Representation
    module Model
      module Common
        class Name < SIF::Represent

          self.representation_wrap = 'Name'

          property :type, :as => 'Type', :attribute => true
          property :prefix, :as => 'Prefix'
          property :last_name, :as => 'LastName'
          property :first_name, :as => 'FirstName'
          property :middle_name, :as => 'MiddleName'
          property :suffix, :as => 'Suffix'
          property :preferred_name, :as => 'PreferredName'
          property :sort_name, :as => 'SortName'
          property :full_name, :as => 'FullName'
        end
      end
    end
  end
end
