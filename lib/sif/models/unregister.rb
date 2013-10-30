module SIF
  module Model
    class Unregister
      include Virtus.model

      attribute :header, Header
    end
  end
end
