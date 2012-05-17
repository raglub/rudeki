# encoding: utf-8

require 'yaml'

module Rudeki
  # Configuration of Rudeki
  module Config

    RAW_CONFIG = File.read(File.expand_path("../config.yml", __FILE__))

    YAML.load(RAW_CONFIG).each do |name, value|
      instance_variable_set("@#{name}", value)
      self.class.class_eval { attr_accessor name.intern }
    end

    def self.set
      yield self
    end

  end # module Config
end # module Rudeki
