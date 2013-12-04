module SIF
  module Representation
    module Model
      module Group
        module SIS
          module SISRepresenter
            include Representable::XML

            property :ref_id, :attribute => true, :as => 'RefId'
            property :metadata, :as => 'SIF_Metadata'
            collection :extended_elements, :as => 'SIF_ExtendedElement', :wrap => 'SIF_ExtendedElements',
                     :class => MODEL_COMMON::ExtendedElement,
                     :decorator => REPR_COMMON::ExtendedElement
          end
        end
      end
    end
  end
end
