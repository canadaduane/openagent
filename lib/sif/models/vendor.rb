module SIF
  module Model
    class Vendor
      include Virtus.model

      attribute :name,    String
      attribute :produce, String
      attribute :version, String
    end
  end
end
