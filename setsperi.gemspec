# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'setsperi/version'

Gem::Specification.new do |spec|
  spec.name          = 'setsperi'
  spec.version       = Setsperi::VERSION
  spec.authors       = ['cwron']
  spec.email         = ['foo@bar.com']
  spec.summary       = 'commandline game of Set'
  spec.description   = 'commandline game of Set'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'pry'
  spec.add_runtime_dependency 'colorize'
  spec.add_development_dependency 'codeclimate-test-reporter'
end
