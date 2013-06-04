# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'locationator/version'

Gem::Specification.new do |spec|
  spec.name          = "locationator"
  spec.version       = Locationator::VERSION
  spec.authors       = ["Lawrence Davis"]
  spec.email         = ["lawrence@lrdiv.com"]
  spec.description   = %q{Get location information.}
  spec.summary       = %q{Use Google's geocoding services to get information about any address.}
  spec.homepage      = "https://github.com/lawrencedavis/locationator"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
