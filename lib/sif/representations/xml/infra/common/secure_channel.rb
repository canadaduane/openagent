module SIF
  module Representation
    module XML
      module Infra
        module Common
          class SecureChannel < SIF::Representation

            self.representation_wrap = 'SIF_SecureChannel'

            property :authentication_level, :as => 'SIF_AuthenticationLevel'
            property :encryption_level, :as => 'SIF_EncryptionLevel'
          end
        end
      end
    end
  end
end
