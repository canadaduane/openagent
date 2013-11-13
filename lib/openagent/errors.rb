module OpenAgent
  class ResponseError < StandardError
    attr_reader :error_object
    def initialize(msg, error_object=nil)
      @error_object = error_object
      super(msg)
    end
  end

  class SIFError < ResponseError
    def initialize(error_object)
      @error_object = error_object
      super(@error_object.desc, @error_object)
    end
  end

  class SIFCodeError < ResponseError
    CODES = {
      0 => "Success. SIF_Status/SIF_Data may contain additional data.",
      7 => "Already have a message with this SIF_MsgId from you.",
      8 => "Receiver is sleeping.",
      9 => "No messages available. This is returned when an agent is trying to pull messages from a ZIS and there are no messages available."
    }
    def initialize(status_code)
      code = CODES[status_code]
      raise "Unknown SIF_Status Code: #{status_code.inspect} (Known Codes: #{CODES.keys.inspect})" if code.nil?
      super("Code #{status_code}: " + code)
    end
  end
end