module SIF
  module Message
    class Unprovide
      include Virtus.model

      attribute :header, Header
      attribute :object, Object
    end
  end
end
