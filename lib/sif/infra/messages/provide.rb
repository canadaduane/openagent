module SIF
  module Infra
    module Message
      class Provide
        include Virtus.model

        attribute :header,  Common::Header
        attribute :objects, Array[Common::Object]

        def object_names
          objects.map{ |o| o.object_name }
        end
      end
    end
  end
end