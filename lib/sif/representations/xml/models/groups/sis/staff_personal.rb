module SIF
  module Representation
    module XML
      module Model
        module Group
          module SIS
            class StaffPersonal <  Representable::Decorator
              include Representable::XML
              include SISRepresenter
              include PersonalRepresenter

              self.representation_wrap = 'StaffPersonal'
              property :title, :as => "Title"
              property :employee_personal_ref_id, :as => "EmployeePersonalRefId"

            end
          end
        end
      end
    end
  end
end