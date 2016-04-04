# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inventory/version'

Gem::Specification.new do |spec|
  spec.name          = "inventory-cli"
  spec.version       = Inventory::VERSION
  spec.authors       = ["skylerto"]
  spec.email         = ["skylerclayne@gmail.com\n"]

  spec.summary       = %q{An inventory management gem}
  spec.description   = %q{A gem that lets you control the flow of products, and orders through invoices}
  spec.homepage      = "https://github.com/skylerto/inventory"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
#  if spec.respond_to?(:metadata)
#    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
#  else
#    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
#  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["inventory"]
  spec.require_paths = ["lib"]

  # Development dependencies
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "aruba"

  # Production dependencies
  spec.add_dependency "thor"
  spec.add_dependency "activerecord"
  spec.add_dependency "mysql"
end
