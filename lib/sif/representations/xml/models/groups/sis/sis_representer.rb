module SIF
  module Representation
    module XML
      module Model
        module Group
          module SIS
            module SISRepresenter
              include Representable::XML

              property :ref_id, :attribute => true, :as => 'RefId'
              property :metadata, :as => 'SIF_Metadata'
              property :extended_elements, :as => 'SIF_ExtendedElements'
            end
          end
        end
      end
    end
  end
end