require_relative 'get_message'
require_relative 'get_zone_status'
require_relative 'get_agent_acl'
require_relative 'ping'
require_relative 'sleep'
require_relative 'wakeup'

module SIF
  module Infra
    module Message
      class SystemControlData
        include Virtus.model

        attribute :get_message,     GetMessage
        attribute :get_zone_status, GetZoneStatus
        attribute :get_agent_acl,   GetAgentACL
        attribute :ping,  Ping
        attribute :sleep, Sleep
        attribute :wake,  Wakeup

        def data
          get_message || ping || sleep || wake
        end

        def data=(assign)
          case assign
          when GetMessage    then self.get_message = assign
          when GetZoneStatus then self.get_zone_status = assign
          when GetAgentACL   then self.get_agent_acl = assign
          when Ping          then self.ping = assign
          when Sleep         then self.sleep = assign
          when Wakeup        then self.wake = assign
          end
        end

      end
    end
  end
end