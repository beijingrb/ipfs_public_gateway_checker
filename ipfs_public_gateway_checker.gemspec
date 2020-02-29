
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ipfs_public_gateway_checker/version"

Gem::Specification.new do |spec|
  spec.name          = "ipfs_public_gateway_checker"
  spec.version       = IpfsPublicGatewayChecker::VERSION
  spec.authors       = ["B1nj0y"]
  spec.email         = ["idegorepl@gmail.com"]

  spec.summary       = %q{IPFS Public Gateway Checker}
  spec.description   = %q{Checks which public gateways are online or not.}
  spec.homepage      = "https://github.com/beijingrb/ipfs_public_gateway_checker"
  spec.license       = "MIT"

  spec.files         = %w[ipfs_public_gateway_checker.gemspec] + Dir["*.md", "bin/*", "lib/**/*.rb"]
  spec.executables   = %w[ipfg]
  spec.require_paths = %w[lib]

  spec.add_dependency "rest-client", "~> 2.0"
  spec.add_dependency "parallel", "~> 1.12"
  spec.add_dependency "concurrent-ruby-edge", "~> 0.4"

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 13.0"
end
