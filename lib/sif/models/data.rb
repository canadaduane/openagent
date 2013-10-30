module SIF
  module Model
    class Data
      require 'sif/models/message'
      include Virtus.model

      attribute :message, Message
    end
  end
end
