module SIF
  module Model
    module Group
      module SIS
        module SISRepresenter
          include Virtus.model

          attribute :extended_elements, Array[MODEL_COMMON::ExtendedElement]
          attribute :metadata, String
          attribute :ref_id, String

          def find_element(name)
            el = extended_elements.find{ |e| e.name == name }
            el ? el.value : nil
          end

          def username
            find_element("USERNAME")
          end
          
          def password
            find_element("PASSWORD")
          end
        end
      end
    end
  end
end