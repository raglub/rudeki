# encoding: utf-8
require "rudeki/config"

Rudeki::Config.methods.each do |method|
  Kernel::send(:alias_method, "old_#{method}".intern, "#{method}".intern)
  # TODO
end

def puts(arg)
  length = 80
  result = " puts -> "+ caller.first.to_s
  old_puts("╔" + "═"*length)
  old_puts("║" + "▒"*length)
  old_puts("#{result}")
  old_puts("║" + "▒"*length)
  old_puts(arg)
  old_puts("║" + "▒"*length)
  old_puts("╚" + "═"*length)
end
