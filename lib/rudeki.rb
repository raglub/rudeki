# encoding: utf-8
require "rudeki/config"

Rudeki::Config.methods.each do |method|
  Kernel::send(:alias_method, "old_#{method}".intern, "#{method}".intern)
  # TODO
end

def puts(arg)
  old_puts("╔═════════ METHOD - PUTS ═════")
  old_puts("  puts -> #{caller.first.to_s}")
  old_puts(arg)
  old_puts("╚═════════════════════════════")
end

class StandardError
  def initialize(value = "RUDEKI ERROR")
    super(value)
    Kernel.puts "╔══════════ ERROR ══════════"
    Kernel.puts "║ message:   #{message}"
    Kernel.puts "║ #{caller.join("\n║ ")}"
    Kernel.puts "╚═══════════════════════════"
  end
end

