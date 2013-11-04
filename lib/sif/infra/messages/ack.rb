module SIF
  module Infra
    module Message
      class Ack
        include Virtus.model

        attribute :original_source_id, String
        attribute :original_msg_id,    String

        attribute :header, Header
        attribute :status, Status
        attribute :error,  Error
      end
    end
  end
end