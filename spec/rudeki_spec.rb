# encoding: utf-8

require 'rudeki'

def result_path
  @result_path ||= File.expand_path("../tmp/result", __FILE__)
  @result_path
end

Rudeki::Config.set do |conf|
  conf.methods = [:p, :puts]
  conf.logdev = result_path
  conf.regexp = "spec\/rudeki_spec"
end

describe Rudeki do

  before(:each) do
    File.delete(result_path) if result_path.include?("rudeki/spec/tmp/result") and File.exist?(result_path)
  end

  it "should properly show frames of method p" do
    p "Test method p"
    result = File.read(result_path)
    result.should include("╔═════════ METHOD - P ═")
    result.should include("/rudeki/spec/rudeki_spec.rb:")
    result.should include("Test method p")
    result.should include("╚═════════")
  end

  it "should properly show frames of method puts" do
    puts "Test method puts"
    result = File.read(result_path)
    result.should include("╔═════════ METHOD - PUTS ═")
    result.should include("/rudeki/spec/rudeki_spec.rb:")
    result.should include("Test method puts")
    result.should include("╚═════════")
  end

  it "should properly show frames of method quarantine" do
    Rudeki.quarantine do
      id.id = 100
    end
    result = File.read(result_path)

    result.should include("╔═════════ RUDEKI::quarantine is continues ═══")
    result.should include("message:")
    result.should include("undefined local variable or method `id' for #")
    result.should include("backtrace:")
  end
end
