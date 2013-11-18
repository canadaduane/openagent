module SIF
  module Representation
    module Infra
      module Message
        class Wakeup < SIF::Represent

          self.representation_wrap = 'SIF_Wakeup'

          property :wakeup, :as => 'SIF_Wakeup'
        end
      end
    end
  end
end
