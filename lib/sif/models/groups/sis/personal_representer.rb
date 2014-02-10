module SIF
  module Model
    module Group
      module SIS
        module PersonalRepresenter
          include Virtus.model

          attribute :name,              MODEL_COMMON::Name
          attribute :local_id,          String
          attribute :state_province_id, String
          attribute :electronic_ids,    Array[MODEL_COMMON::ElectronicId]
          attribute :other_ids,         Array[MODEL_COMMON::OtherId]
          attribute :other_names,       String
          attribute :demographics,      MODEL_COMMON::Demographics
          attribute :addresses,         Array[MODEL_COMMON::Address]
          attribute :phone_numbers,     Array[MODEL_COMMON::PhoneNumber]
          attribute :emails,            Array[MODEL_COMMON::Email]

          def first_name
            name && name.first_name
          end

          def last_name
            name && name.last_name
          end

          def full_name
            name && name.full_name
          end

          def first_email
            emails && emails.map{ |email| email.value.split(/[,;\s]\s?/) }.flatten.first
          end

          def email
            first_email
          end
          def email_prefix
            first_email.split('@')[0] if first_email
          end

          def other_id
            other_ids && other_ids.map{ |other_id| other_id.value }.flatten.first
          end
        end
      end
    end
  end
end