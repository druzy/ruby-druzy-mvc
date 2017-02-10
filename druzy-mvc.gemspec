# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'druzy/mvc/version'

Gem::Specification.new do |spec|
  spec.name          = "druzy-mvc"
  spec.version       = Druzy::MVC::VERSION
  spec.authors       = ["Jonathan Le Greneur"]
  spec.email         = ["jonathan.legreneur@free.fr"]

  spec.summary       = %q{A gem represent the pattern MVC}
  spec.description   = %q{The pattern MVC, see the Readme}
  spec.homepage      = "https://github.com/druzy/ruby-druzy-mvc"
  spec.license       = "MIT"

  spec.files         = Dir['lib/druzy/*.rb']+Dir['lib/druzy/mvc/*.rb']

  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'xml-simple', '>=1.1.5'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
