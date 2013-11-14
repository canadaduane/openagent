module SIF
  module Model
    module Group
      module SIS
        module PersonalRepresenter
          include Virtus.model

          attribute :name, MODEL_COMMON::Name
          attribute :local_id, String
          attribute :state_province_id, String
          attribute :electronic_ids, Array[MODEL_COMMON::ElectronicId]
          attribute :other_ids, Array[MODEL_COMMON::OtherId]
          attribute :other_names, String
          attribute :demographics, Array[MODEL_COMMON::Demographics]
          attribute :addresses, Array[MODEL_COMMON::Address]
          attribute :phone_numbers, Array[MODEL_COMMON::PhoneNumber]
          attribute :emails, Array[MODEL_COMMON::Email]
        end
      end
    end
  end
end