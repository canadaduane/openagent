module SIF
  module Representation
    module Infra
      module Common
        class Message < SIF::Represent; end
        class Data < SIF::Represent

          self.representation_wrap = 'SIF_Data'

          property :message, :as => 'SIF_Message',
                   :class => SIF::Infra::Common::Message,
                   :decorator => Message
        end
      end
    end
  end
end