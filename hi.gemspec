# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hi/version'

Gem::Specification.new do |spec|
  spec.name          = "hi"
  spec.version       = Hi::VERSION
  spec.authors       = ["Chris Hunt"]
  spec.email         = ["c@chrishunt.co"]
  spec.summary       = %q{Hi, I'm here to debug your HTTP}
  spec.description   = %q{Hi, I'm here to debug your HTTP}
  spec.homepage      = "https://github.com/chrishunt/hi"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler',   '~> 1.5'
  spec.add_development_dependency 'rack-test', '~> 0.6.2'
  spec.add_development_dependency 'rake',      '~> 10.1.1'
  spec.add_development_dependency 'rspec',     '~> 2.14.1'
end
