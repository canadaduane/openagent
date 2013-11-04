module SIF
  module Representation
    module XML
      module Infra
        module Message
          class Message < Representable::Decorator
            include Representable::XML

            self.representation_wrap = 'SIF_Message'

            property :xmlns,   :attribute => true
            property :version, :attribute => true, :as => :Version

            property :ack,            :as => 'SIF_Ack',           
                     :class => SIF::Infra::Message::Ack,
                     :decorator => Ack
            property :event,          :as => 'SIF_Event',         
                     :class => SIF::Infra::Message::Event,
                     :decorator => Event
            property :provide,        :as => 'SIF_Provide',       
                     :class => SIF::Infra::Message::Provide,
                     :decorator => Provide
            property :provision,      :as => 'SIF_Provision',     
                     :class => SIF::Infra::Message::Provision,
                     :decorator => Provision
            property :register,       :as => 'SIF_Register',      
                     :class => SIF::Infra::Message::Register,
                     :decorator => Register
            property :request,        :as => 'SIF_Request',       
                     :class => SIF::Infra::Message::Request,
                     :decorator => Request
            property :response,       :as => 'SIF_Response',      
                     :class => SIF::Infra::Message::Response,
                     :decorator => Response
            property :subscribe,      :as => 'SIF_Subscribe',     
                     :class => SIF::Infra::Message::Subscribe,
                     :decorator => Subscribe
            property :system_control, :as => 'SIF_SystemControl', 
                     :class => SIF::Infra::Message::SystemControl,
                     :decorator => SystemControl
            property :unprovide,      :as => 'SIF_Unprovide',     
                     :class => SIF::Infra::Message::Unprovide,
                     :decorator => Unprovide
            property :unregister,     :as => 'SIF_Unregister',    
                     :class => SIF::Infra::Message::Unregister,
                     :decorator => Unregister
            property :unsubscribe,    :as => 'SIF_Unsubscribe',   
                     :class => SIF::Infra::Message::Unsubscribe,
                     :decorator => Unsubscribe
          end
        end
      end
    end
  end
end
