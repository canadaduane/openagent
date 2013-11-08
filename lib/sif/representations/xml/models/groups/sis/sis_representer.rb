module SIF
  module Representation
    module XML
      module Model
        module Group
          module SIS
            module SISRepresenter
              include Representable::XML

              property :ref_id, :attribute => true, :as => 'RefId'
              property :metadata => 'SIF_Metadata'
              property :extended_elements => 'SIF_ExtendedElements'
            end
          end
        end
      end
    end
  end
end