module SIF
  module Model
    class Unprovide
      include Virtus.model

      attribute :header, Header
      attribute :object, Object
    end
  end
end
