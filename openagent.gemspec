# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'openagent/version'

Gem::Specification.new do |gem|
  gem.name          = "openagent"
  gem.summary      = "OpenAgent is a SIF Agent Development Kit"
  gem.description  = "OpenAgent - SIF ADK (SIF Agent Development Kit)"
  gem.homepage     = "http://github.com/cwhiteley/openagent"
  gem.authors      = ['Christopher Whiteley', 'Duane Johnson', 'Eric Adams']
  gem.email        = ['hello@openzis.org', 'duane@instructure.com', 'eadams@instructure.com']

  gem.files = %w[openagent.gemspec README.md]
  gem.files += Dir.glob("lib/**/*.rb")
  gem.files += Dir.glob("spec/**/*")

  gem.test_files    = Dir.glob("spec/**/*")
  gem.require_paths = ["lib"]
  gem.version       = OpenAgent::VERSION
  gem.required_ruby_version = '>= 1.9.0'

  gem.add_development_dependency "rake"
  gem.add_development_dependency "webmock"
  gem.add_development_dependency "bundler", ">= 1.0.0"
  gem.add_development_dependency "rspec", "~> 2.6"
  gem.add_development_dependency "debugger"
  gem.add_development_dependency "pry"

  gem.add_dependency "uuid"
  gem.add_dependency "representable", "~> 1.7.2"
  gem.add_dependency "virtus", "~> 1.0.0"
end
