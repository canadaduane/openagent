require_relative 'system_control_data'

module SIF
  module Representation
    module Infra
      module Message
        class SystemControl < SIF::Represent

          self.representation_wrap = 'SIF_SystemControl'

          property :header, :as => 'SIF_Header',
                   :class => SIF::Infra::Common::Header,
                   :decorator => Infra::Common::Header

          property :system_control_data, :as => 'SIF_SystemControlData',
                   :class => SIF::Infra::Message::SystemControlData,
                   :decorator => Infra::Message::SystemControlData

        end
      end
    end
  end
end
