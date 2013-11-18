module SIF
  module Representation
    module Infra
      module Message
        class Sleep < SIF::Represent

          self.representation_wrap = 'SIF_Sleep'

          property :sleep, :as => 'SIF_Sleep'
        end
      end
    end
  end
end
