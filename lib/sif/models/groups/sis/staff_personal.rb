module SIF
  module Model
    module Group
      module SIS
        class StaffPersonal
          require_relative 'personal_representer'
          require_relative 'sis_representer'

          include Virtus.model
          include PersonalRepresenter
          include SISRepresenter

          attribute :title, String
          attribute :employee_personal_ref_id, String

        end
      end
    end
  end
end
