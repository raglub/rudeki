# encoding: utf-8

module Rudeki::Error

  def initialize(value = "RUDEKI ERROR")
    show_error if Rudeki::Config.errors
    super(value)
  end

  def show_message(title, messages = [])
    rudeki_info "╔══════════ #{title} ══════════"
    messages.each { |message| rudeki_info "║ #{message}" }
    rudeki_info "╚═══════════════════════════"
  end

  def show_error
    track = "#{caller.join("\n║ ")}"
    return if track.include?("rudeki")
    return unless track =~ /#{Rudeki::Config.regexp}/
    show_message("ERROR", [" message:   #{message}", track])
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
