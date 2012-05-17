# encoding: utf-8
require 'rudeki'

Rudeki::Config.set do |conf|
  conf.methods = [:p]
end

#STDIN.readline(puts "3213")
#STDOUT.print
describe Rudeki do
  it "should properly show frames of method puts" do
    puts 123
  end
end
