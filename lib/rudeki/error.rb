# encoding: utf-8

module Rudeki::Error
  def initialize(value = "RUDEKI ERROR")
    if Rudeki::Config.errors
      track = "#{caller.join("\n║ ")}"
      return if track.include?("rudeki")
      return unless track =~ /#{Rudeki::Config.regexp}/
      rudeki_info "╔══════════ ERROR ══════════"
      rudeki_info "║ message:   #{message}"
      rudeki_info "║ #{track}"
      rudeki_info "╚═══════════════════════════"
    end
    super(value)
  end
end

class StandardError
  include Rudeki::Error
end

class ScriptError
  include Rudeki::Error
end

class SignalException
  include Rudeki::Error
end

class SystemExit
  include Rudeki::Error
end

class NoMemoryError
  include Rudeki::Error
end
