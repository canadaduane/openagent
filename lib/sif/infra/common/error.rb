module SIF
  module Infra
    module Common
      class Error
        include Virtus.model

        attribute :category,      String
        attribute :code,          String
        attribute :desc,          String
        attribute :extended_desc, String
      end
    end
  end
end