source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '>= 5.0.0.beta3', '< 5.1'
gem 'pg', '~> 0.18'
gem 'puma'

# Assets stuffs
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', platforms: :ruby

# Frontend stuffs
gem 'jquery-rails'
gem 'turbolinks', '~> 5.x'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'

# Auth
gem 'devise', '~> 4.0.0.rc2'

# I18n
gem 'rails-i18n', '>= 5.0.0.beta3'

# Views stuffs
gem 'simple_form', '~> 3.2', '>= 3.2.1'
gem 'kaminari', github: 'amatsuda/kaminari', branch: '0-17-stable'

# Seed stuffs
gem 'seedbank', '~> 0.3.0'
gem 'faker', '~> 1.6', '>= 1.6.3', require: false

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails', '>= 3.5.0.beta2'
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console', '~> 3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'rubocop', require: false
  gem 'overcommit', require: false
end

group :test do
  gem 'shoulda-matchers', '>= 3.1.1'
  gem 'factory_girl', '>= 4.5.0'
  gem 'database_cleaner', '>= 1.5.1'
  gem 'capybara', '>= 2.6.2'
  gem 'simplecov', require: false
end
