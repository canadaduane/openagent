module SIF
  module Model
    module Group
      module SIS
        module SISRepresenter
          include Virtus.model

          attribute :extended_elements, String
          attribute :metadata, String
          attribute :ref_id, String
        end
      end
    end
  end
end