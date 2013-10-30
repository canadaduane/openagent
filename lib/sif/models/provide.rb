module SIF
  module Model
    class Provide
      include Virtus.model

      attribute :header,  Header
      attribute :objects, Array[Object]

      def object_names
        objects.map{ |o| o.object_name }
      end
    end
  end
end
