module SIF
  module Representation
    module Model
      module Common
        class SchoolContact < SIF::Represent

          self.representation_wrap = 'SchoolContact'

          property :publish_in_directory, :as => 'PublishInDirectory'
          property :contact_info, :as => 'ContactInfo',
                   :class => MODEL_COMMON::ContactInfo,
                   :decorator => REPR_COMMON::ContactInfo
        end
      end
    end
  end
end
