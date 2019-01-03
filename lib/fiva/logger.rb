module Fiva
  class Logger
    def initialize
      @handlers = []
    end

    def add_handler(h)
      @handlers << h
      self
    end

    def write_m(msg)
      @handlers.each do |h|
        h.(self, msg)
      end
      self
    end

    def write(level, msg, **data)
      self.write_m(Message.new(level, msg, **data))
      self
    end

    def debug(msg, **data)
      self.write(Fiva::DEBUG, msg, **data)
      self
    end

    def io(msg, **data)
      self.write(Fiva::IO, msg, **data)
      self
    end

    def info(msg, **data)
      self.write(Fiva::INFO, msg, **data)
      self
    end

    def important(msg, **data)
      self.write(Fiva::IMPORTANT, msg, **data)
      self
    end

    def warning(msg, **data)
      self.write(Fiva::WARNING, msg, **data)
      self
    end

    def error(msg, **data)
      self.write(Fiva::ERROR, msg, **data)
      self
    end

    def fatal(msg, **data)
      self.write(Fiva::FATAL, msg, **data)
      self
    end
  end
end