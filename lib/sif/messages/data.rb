module SIF
  module Message
    class Data
      include Virtus.model

      attribute :message, Message
    end
  end
end
