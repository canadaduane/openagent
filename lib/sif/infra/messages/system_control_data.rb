require_relative 'get_message'
require_relative 'ping'
require_relative 'sleep'
require_relative 'wakeup'

module SIF
  module Infra
    module Message
      class SystemControlData
        include Virtus.model

        attribute :get_message, GetMessage
        attribute :ping, Ping
        attribute :sleep, Sleep
        attribute :wake, Wakeup

      end
    end
  end
end