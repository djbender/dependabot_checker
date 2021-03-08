source 'https://rubygems.org'

# Specify your gem's dependencies in dependabot_scanner.gemspec
gemspec

gem 'rake', '~> 12.0'

group :development do
  gem 'guard-rspec', '~> 4.7', require: false
  gem 'byebug'
end

group :development, :test do
  gem 'rspec', '~> 3.0', require: false
end

concurrent_ruby_version = '~> 1.1'
gem 'concurrent-ruby', concurrent_ruby_version
gem 'concurrent-ruby-ext', concurrent_ruby_version
gem 'concurrent-ruby-edge', '>= 0.6.0', '< 0.7'
