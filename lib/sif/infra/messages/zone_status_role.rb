module SIF
  module Infra
    module Message
      class ZoneStatusRole
        include Virtus.model

        attribute :source_id, String
        attribute :objects, Array[Message::Object]
      end
    end
  end
end