module SIF
  module Model
    class Object
      include Virtus.model

      attribute :object_name, String
    end
  end
end
