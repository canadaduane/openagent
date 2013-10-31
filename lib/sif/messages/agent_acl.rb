module SIF
  module Message
    class AgentACL
      include Virtus.model

      attribute :provide_access
      attribute :subscribe_access
      attribute :publish_add_access
      attribute :publish_change_access
      attribute :publish_delete_access
      attribute :request_access
      attribute :respond_access
      attribute :metadata
      attribute :extended_elements
    end
  end
end