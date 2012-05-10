# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rudeki/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Michał Szyma"]
  gem.email         = ["raglub.ruby@gmail.com"]
  gem.date          = "2012-05-08"
  gem.description   = %q{Gem show you where are used methods puts.}
  gem.summary       = %q{Gem show you where are used methods  puts.}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "rudeki"
  gem.require_paths = ["lib"]
  gem.version       = Rudeki::VERSION
end
