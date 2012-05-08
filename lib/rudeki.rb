# encoding: utf-8

alias :old_puts :puts

def puts(arg)
  result = " puts -> "+ caller.first.to_s
  old_puts("╔" + "═"*(result.size+6) + "╗")
  old_puts("║" + "▒"*(result.size+6)+ "║")
  old_puts("║" + "▒▒ #{result} ▒▒"+ "║")
  old_puts("║" + "▒"*(result.size+6)+ "║")
  old_puts(arg)
  old_puts("║" + "▒"*(result.size+6)+ "║")
  old_puts("╚" + "═"*(result.size+6)+ "╝")
end
