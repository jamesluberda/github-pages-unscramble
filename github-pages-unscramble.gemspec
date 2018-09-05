# frozen_string_literal: true

# lib = File.expand_path("../lib", __FILE__)
lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "github/pages/unscramble/version"

Gem::Specification.new do |spec|
  spec.name          = "github-pages-unscramble"
  spec.version       = Github::Pages::Unscramble::VERSION
  spec.authors       = ["James Luberda"]
  spec.email         = ["james.luberda@gmail.com"]

  spec.summary       = "github-pages-unscramble is a simple Jekyll plugin that undoes some runtime github-pages configuration changes"
  spec.homepage      = "https://github.com/jamesluberda/github-pages-unscramble"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r!^(test|spec|features)/!) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r!^exe/!) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "jekyll", "~> 3.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 0.57.2"
end
