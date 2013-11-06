module SIF
  module Infra
    module Message
      class Event
        include Virtus.model

        attribute :header,      Common::Header
        attribute :object_data, Common::ObjectData
      end
    end
  end
end