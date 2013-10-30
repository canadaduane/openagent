module SIF
  module Model
    class Subscribe
      include Virtus.model

      attribute :header, Header
      attribute :object, Object
    end
  end
end
