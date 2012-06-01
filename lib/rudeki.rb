# encoding: utf-8

require "rudeki/config"
require "logger"

# Kernel.puts
def rudeki_info(message)
  if @logger.nil?
    @logger = Logger.new(Rudeki::Config.logdev || STDOUT)
    @logger.formatter = proc { |severity, datetime, progname, msg|  "#{msg}\n" }
  end
  @logger.info(message)
end

# Show quarantine block
module Rudeki
  def self.quarantine
    yield
    rudeki_info "╔═════════ RUDEKI::quarantine isn't continues ═════════"
    rudeki_info " method quarantine is used in:"
    rudeki_info "   #{caller[0]}"
    rudeki_info "╚══════════════════════════════════════════════════════"
  rescue => e
    rudeki_info "╔═════════ RUDEKI::quarantine is continues ════════════"
    rudeki_info " message:"
    rudeki_info "    #{e.message}"
    rudeki_info " backtrace:"
    rudeki_info "    #{e.backtrace.join("\n    ")}"
    rudeki_info "╚══════════════════════════════════════════════════════"
  end
end

def puts(arg)
  if Rudeki::Config.methods.include?(:puts)
    rudeki_info "╔═════════ METHOD - PUTS ═════"
    rudeki_info " puts -> #{caller.first.to_s}"
    rudeki_info arg
    rudeki_info "╚═════════════════════════════"
  else
    rudeki_info arg
  end
end

def p(arg)
  if Rudeki::Config.methods.include?(:p)
    rudeki_info "╔═════════ METHOD - P ═════"
    rudeki_info " p -> #{caller.first.to_s}"
    rudeki_info arg
    rudeki_info "╚═════════════════════════════"
  else
    rudeki_info arg
  end
end

class StandardError
  def initialize(value = "RUDEKI ERROR")
    if Rudeki::Config.errors
      rudeki_info "╔══════════ ERROR ══════════"
      rudeki_info "║ message:   #{message}"
      rudeki_info "║ #{caller.join("\n║ ")}"
      rudeki_info "╚═══════════════════════════"
    end
    super(value)
  end
end

