# -*- encoding: utf-8 -*-

require File.expand_path('../lib/rudeki/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "rudeki"
  gem.authors       = ["Michał Szyma"]
  gem.email         = ["raglub.ruby@gmail.com"]
  gem.version       = Rudeki::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.date          = "2012-08-13"
  gem.description   = %q{Gem can show where are used methodsi: puts, p. You can locate the bugs}
  gem.summary       = %q{Gem can show where are used methods: puts, p.}
  gem.homepage      = "https://github.com/raglub/rudeki"

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec", ">= 2.10.0"
  gem.add_dependency "logger", ">= 1.2.8"
end

