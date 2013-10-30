module SIF
  module Model
    class Header
      include Virtus.model

      attribute :security,       Security

      attribute :msg_id,         String
      attribute :timestamp,      DateTime
      attribute :source_id,      String
      attribute :destination_id, String
      attribute :contexts,       Array[String]

      def authentication_level
        security.secure_channel.authentication_level
      end

      def encryption_level
        security.secure_channel.encryption_level
      end
    end
  end
end
