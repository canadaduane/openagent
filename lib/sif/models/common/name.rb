module SIF
  module Model
    module Common
      class Name
        include Virtus.model

        attribute :type, String
        attribute :prefix, String
        attribute :last_name, String
        attribute :first_name, String
        attribute :middle_name, String
        attribute :suffix, String
        attribute :preferred_name, String
        attribute :sort_name, String
        attribute :full_name, String
      end
    end
  end
end