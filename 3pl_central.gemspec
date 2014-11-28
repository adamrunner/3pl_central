# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require '3pl_central/version'

Gem::Specification.new do |spec|
  spec.name          = "3pl_central"
  spec.version       = ThreePLCentral::VERSION
  spec.authors       = ["Adam Runner"]
  spec.email         = ["adamrunner@gmail.com"]
  spec.summary       = "Ruby wrapper for the 3PL Central API"
  spec.description   = "Ruby wrapper for the 3PL Central API"
  spec.homepage      = "https://github.com/adamrunner/3pl_central"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency 'rspec-legacy_formatters'
  spec.add_development_dependency "vcr"

  spec.add_runtime_dependency "savon", "~> 2.7"
end
