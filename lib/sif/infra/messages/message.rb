module SIF
  module Infra
    module Message
      class Message
        include Virtus.model

        attribute :xmlns,          String
        attribute :version,        String

        attribute :ack,            Ack
        attribute :event,          Event
        attribute :provide,        Provide
        attribute :provision,      Provision
        attribute :register,       Register
        attribute :request,        Request
        attribute :response,       Response
        attribute :subscribe,      Subscribe
        attribute :system_control, SystemControl
        attribute :unprovide,      Unprovide
        attribute :unregister,     Unregister
        attribute :unsubscribe,    Unsubscribe
      end
    end
  end
end