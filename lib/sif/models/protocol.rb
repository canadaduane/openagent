module SIF
  module Model
    class Protocol
      include Virtus.model

      attribute :type,       String
      attribute :secure,     String
      attribute :url,        String
      attribute :properties, Array[Property]
    end
  end
end
