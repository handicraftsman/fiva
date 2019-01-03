require 'date'

require 'pastel'

require 'fiva/version'

module Fiva
  class Error < StandardError; end

  FATAL = 6
  ERROR = 5
  WARNING = 4
  IMPORTANT = 3
  INFO = 2
  IO = 1
  DEBUG = 0

  LEVELS = ['DBG', ' IO', 'INF', 'IMP', 'WRN', 'ERR', 'FTL']
  FULL_LEVELS = ['DEBUG', 'IO', 'INFO', 'IMPORTANT', 'WARNING', 'ERROR', 'FATAL']
end

require 'fiva/text_value'
require 'fiva/message'
require 'fiva/handlers'
require 'fiva/logger'
