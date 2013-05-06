# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'winding-polygon/version'

Gem::Specification.new do |gem|
  gem.name          = "winding-polygon"
  gem.version       = WindingPolygon::VERSION
  gem.authors       = ["Martin Xu"]
  gem.email         = ["mxu2008@gmail.com"]
  gem.description   = %q{Use Bentley-Ottmann algorithm to solve self-intersecting polygon issue }
  gem.summary       = %q{Detect intersecting points and decompose it into multi-polygons}
  gem.homepage      = ""
  gem.license       = "MIT"

  gem.add_development_dependency "rspec", "~> 2.6"
  gem.add_development_dependency "test-unit"

  #gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
end
