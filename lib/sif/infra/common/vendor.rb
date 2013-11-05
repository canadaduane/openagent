module SIF
  module Infra
    module Common
      class Vendor
        include Virtus.model

        attribute :name,    String
        attribute :produce, String
        attribute :version, String
      end
    end
  end
end