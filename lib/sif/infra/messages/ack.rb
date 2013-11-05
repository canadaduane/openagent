module SIF
  module Infra
    module Message
      class Ack
        include Virtus.model

        attribute :original_source_id, String
        attribute :original_msg_id,    String

        attribute :header, Common::Header
        attribute :status, Common::Status
        attribute :error,  Common::Error
      end
    end
  end
end