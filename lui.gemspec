# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lui/version'

Gem::Specification.new do |gem|
  gem.name          = "lui"
  gem.version       = Lui::VERSION
  gem.authors       = ["Lutfi Demirci"]
  gem.email         = ["lutfidemirci@gmail.com"]
  gem.description   = %q{lui blog engine.}
  gem.summary       = %q{lui blog engine.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
