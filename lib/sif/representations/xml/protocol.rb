module SIF
  module Representation
    module XML
      class Protocol < Representable::Decorator
        include Representable::XML

        self.representation_wrap = 'SIF_Ack'

        property :original_source_id, :as => 'SIF_OriginalSourceId'
        property :original_msg_id,    :as => 'SIF_OriginalMsgId'

        property :type,   :as => 'Type', :attribute => true
        property :secure, :as => 'Secure', :attribute => true
        property :url,    :as => 'SIF_URL'
        collection :properties, :as => 'SIF_Property',
                   :class => SIF::Model::Property, :decorator => XML::Property
      end
    end
  end
end