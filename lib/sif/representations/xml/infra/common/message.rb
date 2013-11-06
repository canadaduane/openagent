module SIF
  module Representation
    module XML
      module Infra
        module Common
          class Message < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_Message'

            property :xmlns,   :attribute => true
            property :version, :attribute => true, :as => :Version

            property :ack,            :as => 'SIF_Ack',           
                     :class => SIF::Infra::Common::Ack,
                     :decorator => Ack
            property :event,          :as => 'SIF_Event',         
                     :class => SIF::Infra::Common::Event,
                     :decorator => Event
            property :provide,        :as => 'SIF_Provide',       
                     :class => SIF::Infra::Common::Provide,
                     :decorator => Provide
            property :provision,      :as => 'SIF_Provision',     
                     :class => SIF::Infra::Common::Provision,
                     :decorator => Provision
            property :register,       :as => 'SIF_Register',      
                     :class => SIF::Infra::Common::Register,
                     :decorator => Register
            property :request,        :as => 'SIF_Request',       
                     :class => SIF::Infra::Common::Request,
                     :decorator => Request
            property :response,       :as => 'SIF_Response',      
                     :class => SIF::Infra::Common::Response,
                     :decorator => Response
            property :subscribe,      :as => 'SIF_Subscribe',     
                     :class => SIF::Infra::Common::Subscribe,
                     :decorator => Subscribe
            property :system_control, :as => 'SIF_SystemControl', 
                     :class => SIF::Infra::Common::SystemControl,
                     :decorator => SystemControl
            property :unprovide,      :as => 'SIF_Unprovide',     
                     :class => SIF::Infra::Common::Unprovide,
                     :decorator => Unprovide
            property :unregister,     :as => 'SIF_Unregister',    
                     :class => SIF::Infra::Common::Unregister,
                     :decorator => Unregister
            property :unsubscribe,    :as => 'SIF_Unsubscribe',   
                     :class => SIF::Infra::Common::Unsubscribe,
                     :decorator => Unsubscribe
          end
        end
      end
    end
  end
end
