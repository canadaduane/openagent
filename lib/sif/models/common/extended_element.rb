module SIF
  module Model
    module Common
      class ExtendedElement
          include Virtus.model

          attribute :name, String
          attribute :value
      end
    end
  end
end