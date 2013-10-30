module SIF
  module Model
    class Property
      include Virtus.model

      attribute :name,  String
      attribute :value, String
    end
  end
end
