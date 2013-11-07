module SIF
  module Representation
    module XML
      module Model
        module Group
          module SIS
            class StudentPersonal < Representable::Decorator
              include Representable::XML
              include SISRepresenter
              include SISPersonalRepresenter

              self.representation_wrap = 'StudentPersonal'

              property :projected_graduation_year, :as => "ProjectedGraduationYear"
              property :on_time_graduation_year, :as => "OnTimeGraduationYear"
              property :graduation_date, :as => "GraduationDate"
              property :most_recent, :as => "MostRecent"
              property :acceptable_use_policy, :as => "AcceptableUsePolicy"
              property :idea, :as => "IDEA"
              property :migrant, :as => "Migrant"
              property :title1, :as => "Title1"
              property :gifted_talented, :as => "GiftedTalented"
              property :ell, :as => "ELL"
              property :homeless, :as => "Homeless"
              property :section504, :as => "Section504"
              property :vocational_concentrator, :as => "VocationalConcentrator"
              property :immigrant, :as => "Immigrant"
              property :neglected_delinquent, :as => "NeglectedDelinquent"
              property :metadata, :as => "SIF_Metadata"
              property :extended_elements, :as => "SIF_ExtendedElements"
              classmodel = SIF::Model
              xmldecorator = SIF::Representation::XML
              collection :alert_messages, :as => "AlertMessages",
                         :class => classmodel::AlertMessage,
                         :decorator => xmldecorator::AlertMessage
              collection :medical_alert_messages, :as => "MedicalAlertMessages",
                         :class => SIF::Model::MedicalAlertMessage,
                         :decorator => SIF::Representation::XML::MedicalAlertMessage
            end
          end
        end
      end
    end
  end
end
