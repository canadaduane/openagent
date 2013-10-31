module SIF
  module Message
    class Subscribe
      include Virtus.model

      attribute :header, Header
      attribute :object, Object
    end
  end
end
