module SIF
  module Representation
    module XML
      class Message < Representable::Decorator
        include Representable::XML

        self.representation_wrap = 'SIF_Message'

        property :xmlns,   :attribute => true
        property :version, :attribute => true, :as => :Version

        property :ack,            :as => 'SIF_Ack',           
                 :class => SIF::Model::Ack,           :decorator => XML::Ack
        property :event,          :as => 'SIF_Event',         
                 :class => SIF::Model::Event,         :decorator => XML::Event
        property :provide,        :as => 'SIF_Provide',       
                 :class => SIF::Model::Provide,       :decorator => XML::Provide
        property :provision,      :as => 'SIF_Provision',     
                 :class => SIF::Model::Provision,     :decorator => XML::Provision
        property :register,       :as => 'SIF_Register',      
                 :class => SIF::Model::Register,      :decorator => XML::Register
        property :request,        :as => 'SIF_Request',       
                 :class => SIF::Model::Request,       :decorator => XML::Request
        property :response,       :as => 'SIF_Response',      
                 :class => SIF::Model::Response,      :decorator => XML::Response
        property :subscribe,      :as => 'SIF_Subscribe',     
                 :class => SIF::Model::Subscribe,     :decorator => XML::Subscribe
        property :system_control, :as => 'SIF_SystemControl', 
                 :class => SIF::Model::SystemControl, :decorator => XML::SystemControl
        property :unprovide,      :as => 'SIF_Unprovide',     
                 :class => SIF::Model::Unprovide,     :decorator => XML::Unprovide
        property :unregister,     :as => 'SIF_Unregister',    
                 :class => SIF::Model::Unregister,    :decorator => XML::Unregister
        property :unsubscribe,    :as => 'SIF_Unsubscribe',   
                 :class => SIF::Model::Unsubscribe,   :decorator => XML::Unsubscribe
      end
    end
  end
end
