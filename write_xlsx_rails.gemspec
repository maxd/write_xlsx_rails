# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'write_xlsx_rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'write_xlsx_rails'
  spec.version       = WriteXlsxRails::VERSION
  spec.authors       = ['Maxim Dobryakov']
  spec.email         = ['maxim.dobryakov@gmail.com']
  spec.description   = 'xlsx renderer for Rails base on write_xlsx gem'
  spec.summary       = 'xlsx renderer for Rails'
  spec.homepage      = 'https://github.com/maxd/write_xlsx_rails'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'write_xlsx'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
