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

              property :employee_personal_ref_id, :as => 'EmployeePersonalRefId'
              property :title, :as => 'Title'
            end
          end
        end
      end
    end
  end
end