module SIF
  module Model
    class SystemControl
      include Virtus.model

      attribute :header,              Header
      attribute :system_control_data, Array[String]

    end
  end
end
