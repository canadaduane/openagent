require_relative 'get_message'
require_relative 'ping'
require_relative 'sleep'
require_relative 'wakeup'

module SIF
  module Representation
    module XML
      module Infra
        module Message
          class SystemControlData < SIF::Representation

            self.representation_wrap = 'SIF_SystemControlData'

            property :get_message,    :as => 'SIF_GetMessage',
                     :class => SIF::Infra::Message::GetMessage,
                     :decorator => GetMessage
            property :ping,    :as => 'SIF_Ping',
                     :class => SIF::Infra::Message::Ping,
                     :decorator => Ping
            property :sleep,    :as => 'SIF_Sleep',
                     :class => SIF::Infra::Message::Sleep,
                     :decorator => Sleep
            property :wake,    :as => 'SIF_Wake',
                     :class => SIF::Infra::Message::Wakeup,
                     :decorator => Wakeup

          end
        end
      end
    end
  end
end
