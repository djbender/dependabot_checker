require_relative 'lib/dependabot_scanner/version'

Gem::Specification.new do |spec|
  spec.name          = "dependabot_scanner"
  spec.version       = DependabotScanner::VERSION
  spec.authors       = ["Derek Bender"]
  spec.email         = ["170351+djbender@users.noreply.github.com"]

  spec.summary       = %q{Check an organization for dependabot configuration.}
  spec.homepage      = "https://github.com/djbender/dependabot_scanner"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/djbender/dependabot_scanner"
  spec.metadata["changelog_uri"] = "https://github.com/djbender/dependabot_scanner/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "octokit", "~> 4.19"
  spec.add_runtime_dependency "dotenv-rails", "~> 2.7"
end
