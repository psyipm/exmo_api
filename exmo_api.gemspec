# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'exmo_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'exmo_api'
  spec.version       = ExmoApi::VERSION
  spec.authors       = ['Igor Malinovskiy']
  spec.email         = ['igor.malinovskiy@netfixllc.org']

  spec.summary       = 'Ruby wrapper for Exmo.com API'
  spec.description   = 'This gem provides access to public and trade API of Exmo.com exchange'
  spec.homepage      = 'https://github.com/psyipm/exmo_api'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'bin'
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'bundler-audit', '~> 0.6.0'
  spec.add_development_dependency 'guard-rspec', '~> 4.7', '>= 4.7.3'
  spec.add_development_dependency 'overcommit'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'reek'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'webmock', '~> 3.4', '>= 3.4.2'
end
