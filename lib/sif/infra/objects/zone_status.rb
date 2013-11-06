module SIF
  module Infra
    module Object
      class ZoneStatus
        include Virtus.model

        attribute :vendor,  Common::Vendor

        attribute :zone_id, String
        attribute :name,    String
        attribute :icon,    String
        attribute :providers
        attribute :subscribers
        attribute :add_publishers
        attribute :change_publishers
        attribute :delete_publishers
        attribute :responders
        attribute :requesters
        attribute :sif_nodes
        attribute :supported_authentication
        attribute :supported_protocols
        attribute :supported_versions
        attribute :administration_url
        attribute :contexts
        attribute :metadata
        attribute :extended_elements
      end
    end
  end
end