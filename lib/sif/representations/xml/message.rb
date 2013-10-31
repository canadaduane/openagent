module SIF
  module Representation
    module XML
      class Message < Representable::Decorator
        include Representable::XML

        self.representation_wrap = 'SIF_Message'

        property :xmlns,   :attribute => true
        property :version, :attribute => true, :as => :Version

        property :ack,            :as => 'SIF_Ack',           
                 :class => SIF::Message::Ack,           :decorator => XML::Ack
        property :event,          :as => 'SIF_Event',         
                 :class => SIF::Message::Event,         :decorator => XML::Event
        property :provide,        :as => 'SIF_Provide',       
                 :class => SIF::Message::Provide,       :decorator => XML::Provide
        property :provision,      :as => 'SIF_Provision',     
                 :class => SIF::Message::Provision,     :decorator => XML::Provision
        property :register,       :as => 'SIF_Register',      
                 :class => SIF::Message::Register,      :decorator => XML::Register
        property :request,        :as => 'SIF_Request',       
                 :class => SIF::Message::Request,       :decorator => XML::Request
        property :response,       :as => 'SIF_Response',      
                 :class => SIF::Message::Response,      :decorator => XML::Response
        property :subscribe,      :as => 'SIF_Subscribe',     
                 :class => SIF::Message::Subscribe,     :decorator => XML::Subscribe
        property :system_control, :as => 'SIF_SystemControl', 
                 :class => SIF::Message::SystemControl, :decorator => XML::SystemControl
        property :unprovide,      :as => 'SIF_Unprovide',     
                 :class => SIF::Message::Unprovide,     :decorator => XML::Unprovide
        property :unregister,     :as => 'SIF_Unregister',    
                 :class => SIF::Message::Unregister,    :decorator => XML::Unregister
        property :unsubscribe,    :as => 'SIF_Unsubscribe',   
                 :class => SIF::Message::Unsubscribe,   :decorator => XML::Unsubscribe
      end
    end
  end
end
