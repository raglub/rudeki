# encoding: utf-8
require 'rudeki'

Rudeki::Config.set do |conf|
  conf.methods = [:p]
end

describe Rudeki do
  it "should properly show frames of method puts" do
    p 123
  end
end
