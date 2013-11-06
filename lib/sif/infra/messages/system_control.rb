module SIF
  module Infra
    module Message
      class SystemControl
        include Virtus.model

        attribute :header,              Common::Header
        attribute :system_control_data, Array[String]

      end
    end
  end
end