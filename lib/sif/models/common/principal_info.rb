module SIF
  module Model
    module Common
      class PrincipalInfo
        include Virtus.model

        attribute :contact_name
        attribute :contact_title
      end
    end
  end
end