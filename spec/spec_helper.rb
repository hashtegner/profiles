if ENV['COV']
  require 'simplecov'
  SimpleCov.start 'rails' do
    add_group 'Queries', 'app/queries'
  end
end

Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each do |f|
  require f
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include I18nHelpers
end
