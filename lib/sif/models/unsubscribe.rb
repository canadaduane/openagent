module SIF
  module Model
    class Unsubscribe
      include Virtus.model

      attribute :header, Header
      attribute :object, Object
    end
  end
end
