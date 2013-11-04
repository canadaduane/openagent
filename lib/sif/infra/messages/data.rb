module SIF
  module Infra
    module Message
      class Data
        include Virtus.model

        attribute :message, Message
      end
    end
  end
end