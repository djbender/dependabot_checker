require 'rspec'
require 'dependabot_scanner'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.fail_if_no_examples = true

  config.order = :rand

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
