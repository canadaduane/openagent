module SIF
  module Representation
    module XML
      class StudentPersonal < Representable::Decorator
        include Representable::XML

        self.representation_wrap = 'StudentPersonal'

      end
    end
  end
end