# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "resource_spec/version"

Gem::Specification.new do |spec|
  spec.name          = "resource_spec"
  spec.version       = ResourceSpec::VERSION
  spec.authors       = ["Victor Sokolov"]
  spec.email         = ["gzigzigzeo@evilmartians.com"]

  spec.summary       = %(RSpec shared examples for testing Rails REST controllers)
  spec.description   = %(RSpec shared examples for testing Rails REST controllers)
  spec.homepage      = "https://github.com/gzigzigzeo/resource_spec"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "http://gemcutter.org"
  else
    fail(
      "RubyGems 2.0 or newer is required to protect against public gem pushes."
    )
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rails"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "factory_girl"
  spec.add_development_dependency "ffaker"
  spec.add_development_dependency "responders", "~> 2.0"
  spec.add_development_dependency "database_cleaner"
  spec.add_dependency "rspec"
  spec.add_dependency "rspec-rails"
end
