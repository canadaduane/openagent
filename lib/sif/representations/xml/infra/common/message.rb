module SIF
  module Representation
    module XML
      module Infra
        module Common
          class Message < SIF::Represent

            remove_namespaces!

            self.representation_wrap = 'SIF_Message'

            property :xmlns,   :attribute => true
            property :version, :attribute => true, :as => :Version

            property :ack,            :as => 'SIF_Ack',           
                     :class => SIF::Infra::Message::Ack,
                     :decorator => Infra::Message::Ack
            property :event,          :as => 'SIF_Event',         
                     :class => SIF::Infra::Message::Event,
                     :decorator => Infra::Message::Event
            property :provide,        :as => 'SIF_Provide',       
                     :class => SIF::Infra::Message::Provide,
                     :decorator => Infra::Message::Provide
            property :provision,      :as => 'SIF_Provision',     
                     :class => SIF::Infra::Message::Provision,
                     :decorator => Infra::Message::Provision
            property :register,       :as => 'SIF_Register',      
                     :class => SIF::Infra::Message::Register,
                     :decorator => Infra::Message::Register
            property :request,        :as => 'SIF_Request',       
                     :class => SIF::Infra::Message::Request,
                     :decorator => Infra::Message::Request
            property :response,       :as => 'SIF_Response',      
                     :class => SIF::Infra::Message::Response,
                     :decorator => Infra::Message::Response
            property :subscribe,      :as => 'SIF_Subscribe',     
                     :class => SIF::Infra::Message::Subscribe,
                     :decorator => Infra::Message::Subscribe
            property :system_control, :as => 'SIF_SystemControl', 
                     :class => SIF::Infra::Message::SystemControl,
                     :decorator => Infra::Message::SystemControl
            # property :unprovide,      :as => 'SIF_Unprovide',     
            #          :class => SIF::Infra::Message::Unprovide,
            #          :decorator => Infra::Message::Unprovide
            # property :unregister,     :as => 'SIF_Unregister',    
            #          :class => SIF::Infra::Message::Unregister,
            #          :decorator => Infra::Message::Unregister
            # property :unsubscribe,    :as => 'SIF_Unsubscribe',   
            #          :class => SIF::Infra::Message::Unsubscribe,
            #          :decorator => Infra::Message::Unsubscribe
          end
        end
      end
    end
  end
end
