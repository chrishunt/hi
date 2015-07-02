# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hi/version'

Gem::Specification.new do |spec|
  spec.name          = "hi"
  spec.version       = Hi::VERSION
  spec.authors       = ["Chris Hunt"]
  spec.email         = ["c@chrishunt.co"]
  spec.summary       = %q{hi, I'm here to debug your HTTP}
  spec.description   = %q{hi, I'm here to debug your HTTP}
  spec.homepage      = "https://github.com/chrishunt/hi"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'awesome_print', '~> 1.6.1'
  spec.add_dependency 'thin',          '~> 1.6.3'

  spec.add_development_dependency 'cane',           '~> 2.6.2'
  spec.add_development_dependency 'cane-hashcheck', '~> 1.2.0'
  spec.add_development_dependency 'coveralls',      '~> 0.8.2'
  spec.add_development_dependency 'mute',           '~> 1.1.0'
  spec.add_development_dependency 'pry',            '~> 0.9.12.4'
  spec.add_development_dependency 'rack-test',      '~> 0.6.2'
  spec.add_development_dependency 'rake',           '~> 10.1.1'
  spec.add_development_dependency 'rspec',          '~> 2.14.1'
end
