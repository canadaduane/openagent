require_relative 'system_control_data'

module SIF
  module Infra
    module Message
      class SystemControl
        include Virtus.model

        attribute :header,              Common::Header
        attribute :system_control_data, Message::SystemControlData

      end
    end
  end
end