module SIF
  module Model
    class Application
      include Virtus.model

      attribute :vendor,  String
      attribute :product, String
      attribute :version, String
    end
  end
end
