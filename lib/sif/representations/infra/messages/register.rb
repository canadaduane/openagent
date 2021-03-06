module SIF
  module Representation
    module Infra
      module Message
        class Register < SIF::Represent

          self.representation_wrap = 'SIF_Register'

          property :header, :as => 'SIF_Header',
                   :class => SIF::Infra::Common::Header,
                   :decorator => Infra::Common::Header
          property :protocol, :as => 'SIF_Protocol',
                   :class => SIF::Infra::Common::Protocol,
                   :decorator => Infra::Common::Protocol
          property :application, :as => 'SIF_Application',
                   :class => SIF::Infra::Common::Application,
                   :decorator => Infra::Common::Application
          
          property :name, :as => 'SIF_Name'
          property :version, :as => 'SIF_Version'
          property :max_buffer_size, :as => 'SIF_MaxBufferSize'
          property :mode, :as => 'SIF_Mode'
          property :node_vendor, :as => 'SIF_NodeVendor'
          property :node_version, :as => 'SIF_NodeVersion'
          property :icon, :as => 'SIF_Icon'
        end
      end
    end
  end
end
