module Fiva
  class Message
    attr_accessor :timestamp, :level, :msg, :data

    def initialize(level, msg, **data)
      @timestamp = DateTime.now
      @level = level
      @msg   = msg
      @data  = data
    end

    def to_hash
      {
        timestamp: @timestamp,
        level:     @level,
        msg:       @msg,
        data:      @data
      }
    end

    def to_json
      self.to_hash.to_json
    end
  end
end