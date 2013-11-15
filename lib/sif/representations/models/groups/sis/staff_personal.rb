module SIF
  module Representation
    module Model
      module Group
        module SIS
          class StaffPersonal < SIF::Represent
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
