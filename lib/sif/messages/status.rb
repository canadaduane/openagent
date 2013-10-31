module SIF
  module Message
    class Status
      include Virtus.model

      attribute :data, Data

      attribute :code, String
      attribute :desc, String
    end
  end
end
