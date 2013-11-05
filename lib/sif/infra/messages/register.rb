module SIF
  module Infra
    module Message
      class Register
        include Virtus.model

        attribute :header,          Common::Header
        attribute :protocol,        Common::Protocol
        attribute :application,     Common::Application
        
        attribute :name,            String
        attribute :version,         String
        attribute :max_buffer_size, Integer
        attribute :mode,            String
        attribute :node_vendor,     String
        attribute :node_version,    String
        attribute :icon,            String
      end
    end
  end
end