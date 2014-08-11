# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'provider/version'

Gem::Specification.new do |spec|
  spec.name          = "provider"
  spec.version       = Provider::VERSION
  spec.authors       = ["Bruno Andrade","Fernando Pereira"]
  spec.email         = ["bruno77sa@gmail.com","fernandopereirala@gmail.com"]
  spec.summary       = %q{A Ruby gem to a cloud hosting provider.}
  spec.description   = %q{This gem wraps the DigitalOcean API documented at https://developers.digitalocean.com/}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty'
  spec.add_dependency 'json'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
