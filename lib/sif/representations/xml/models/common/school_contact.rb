module SIF
  module Representation
    module XML
      module Model
        module Common
          class SchoolContact < Representable::Decorator
            require_relative 'contact_info'

            include Representable::XML

            self.representation_wrap = 'SchoolContact'

            property :publish_in_directory, :as => 'PublishInDirectory'
            property :contact_info, :as => 'ContactInfo',
                     :class => MODEL_COMMON::ContactInfo,
                     :decorator => XML_COMMON::ContactInfo
          end
        end
      end
    end
  end
end