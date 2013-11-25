# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'b_good/version'

Gem::Specification.new do |spec|
  spec.name          = "b_good"
  spec.version       = BGood::VERSION
  spec.authors       = ["Killian Jimenez"]
  spec.email         = ["alu0100502053@ull.edu.es"]
  spec.description   = %q{Gema para matrices dispersas y matrices densas}
  spec.summary       = %q{Representacion de matrices dispersas y matrices densas}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
