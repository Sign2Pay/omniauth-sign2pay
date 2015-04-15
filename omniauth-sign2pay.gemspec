# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-sign2pay/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-sign2pay"
  spec.version       = OmniAuth::Sign2pay::VERSION
  spec.authors       = ["Stephanie Nemeth", "Joost Baaij"]
  spec.email         = ["stephanie@spacebabies.nl", "joost@spacebabies.nl"]
  spec.summary       = %q{OmniAuth strategy for Sign2Pay.}
  spec.description   = %q{OmniAuth strategy for Sign2Pay.}
  spec.homepage      = "https://github.com/Sign2Pay/omniauth-sign2pay"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'omniauth', '~> 1.0'
  spec.add_development_dependency 'rspec', '3.2.0'
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
