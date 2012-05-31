# encoding: utf-8

require "rudeki/config"
#require 'logger' # todo

def messages(message = "")
  @messages ||= ""
  @messages << message
  @messages
end


def logger(message)
  Kernel.puts message
end

# Show quarantine block
module Rudeki

  def self.quarantine
    yield
    logger "╔═════════ RUDEKI::quarantine isn't continues ═════════"
    logger " method quarantine is used in:"
    logger "   #{caller[0]}"
    logger "╚══════════════════════════════════════════════════════"
  rescue => e
    logger "╔═════════ RUDEKI::quarantine is continues ════════════"
    logger " message:"
    logger "    #{e.message}"
    logger " backtrace:"
    logger "    #{e.backtrace.join("\n    ")}"
    logger "╚══════════════════════════════════════════════════════"
  end
end

def puts(arg)
  if Rudeki::Config.methods.include?(:puts)
    logger("╔═════════ METHOD - PUTS ═════")
    logger(" puts -> #{caller.first.to_s}")
    logger(arg)
    logger("╚═════════════════════════════")
  else
    logger(arg)
  end
end

def p(arg)
  if Rudeki::Config.methods.include?(:p)
    logger("╔═════════ METHOD - P ═════")
    logger(" p -> #{caller.first.to_s}")
    logger(arg)
    logger("╚═════════════════════════════")
  else
    Kernel.p(arg)
  end
end

class StandardError
  def initialize(value = "RUDEKI ERROR")
    if Rudeki::Config.errors
      logger "╔══════════ ERROR ══════════"
      logger "║ message:   #{message}"
      logger "║ #{caller.join("\n║ ")}"
      logger "╚═══════════════════════════"
    end
    super(value)
  end
end

