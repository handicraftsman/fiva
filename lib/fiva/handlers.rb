module Fiva
  PLE = ['data', 'text', 'body', 'info', 'payload']

  def self.puts_handler(**opts)
    level   = opts.fetch :level,   Fiva::INFO
    padding = opts.fetch :padding, 32
    ple     = opts.fetch :ple,     Fiva::PLE
    target  = opts.fetch :target,  STDERR
    colored = opts.fetch :colored, true

    pastel = Pastel.new
    
    lc = [
      pastel.green.detach,
      pastel.cyan.detach,
      pastel.blue.detach,
      pastel.white.detach,
      pastel.yellow.detach,
      pastel.red.detach,
      pastel.magenta.detach
    ]

    gl = ->(l) {
      return (Fiva::LEVELS[l] || "UNK") unless colored
      (lc[l] || pastel.clear.detach).(Fiva::LEVELS[l] || "UNK")
    }

    cl = ->(l, t) {
      return t unless colored
      (lc[l] || pastel.clear.detach).(t)
    }

    return ->(logger, msg) {
      return if msg.level < level
      
      data = msg.data
        .filter { |k, v| not Fiva::PLE.include? k.to_s }
        .map { |k, v| "#{cl.(msg.level, k)}: #{v.inspect}" }
        .join(' ')

      str = "#{msg.timestamp.strftime} " +
        "#{gl.(msg.level)} " +
        "#{"%-#{padding}s" % msg.msg.to_s} " +
        "#{data}"
      
      msg.data
        .filter { |k, v| Fiva::PLE.include? k.to_s }
        .each_pair { |k, v| str << "\n#{cl.(msg.level, k)}:\n  #{v.to_s.gsub(/\n/, "\n  ")}" }

      target.puts(str)
    }
  end

  def self.putsr_handler(**opts)
    level  = opts.fetch :level,  Fiva::INFO
    target = opts.fetch :target, STDERR
    func   = opts.fetch :func,   ->(msg) { msg.msg.to_s }

    return ->(logger, msg) {
      return if msg.level < level

      target.puts func.(msg)
    }
  end
end