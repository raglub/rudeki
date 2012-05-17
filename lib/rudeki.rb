# encoding: utf-8

require "rudeki/config"

def puts(arg)
  if Rudeki::Config.methods.include?(:puts)
    Kernel.puts("╔═════════ METHOD - PUTS ═════")
    Kernel.puts(" puts -> #{caller.first.to_s}")
    Kernel.puts(arg)
    Kernel.puts("╚═════════════════════════════")
  else
    Kernel.puts(arg)
  end
end

def p(arg)
  if Rudeki::Config.methods.include?(:p)
    Kernel.puts("╔═════════ METHOD - P ═════")
    Kernel.puts(" p -> #{caller.first.to_s}")
    Kernel.puts(arg)
    Kernel.puts("╚═════════════════════════════")
  else
    Kernel.p(arg)
  end
end

class StandardError
  def initialize(value = "RUDEKI ERROR")
    if Rudeki::Config.errors
      Kernel.puts "╔══════════ ERROR ══════════"
      Kernel.puts "║ message:   #{message}"
      Kernel.puts "║ #{caller.join("\n║ ")}"
      Kernel.puts "╚═══════════════════════════"
    end
    super(value)
  end
end

