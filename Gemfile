source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jb'
gem 'view_component', require: 'view_component/engine'
gem 'bcrypt', '~> 3.1.7'
# Use Active Storage variant
gem 'image_processing', '~> 1.2'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
# Hotwire
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'aws-sdk-s3', require: false

# App gems
gem 'simple_form'
gem 'devise'
gem 'devise-jwt', '~> 0.7.0'
gem 'rack-cors'
gem 'will_paginate'
gem 'apartment', github: 'frank-labz/apartment', branch: 'fix-version-constraint'
gem 'cocoon'
gem 'zipline'
gem 'interactor', '~> 3.0'

# NF-e
gem 'xmldsig', '~> 0.6.6'
gem 'nokogiri', '~> 1.11'
gem 'httparty'
gem 'wasabi'

# Queue
gem 'sidekiq', '~> 6'
gem 'sidekiq-cron', '~> 1.1'
gem 'apartment-sidekiq'

# GraphQL
gem 'graphql'
gem 'graphql-batch'

group :development, :test do
  gem 'rspec-rails'
  gem 'letter_opener'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i(mri mingw x64_mingw)
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rubocop', '~> 1.10', require: false
  gem 'rubocop-airbnb', github: 'frank-labz/ruby', glob: 'rubocop-airbnb/rubocop-airbnb.gemspec'
  gem 'rubocop-daemon', github: 'cumet04/rubocop-daemon', branch: 'binding_option', require: false
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  # gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'pry'
end

group :test do
  gem 'database_cleaner'
  gem 'simplecov', require: false
end

gem "webrick", "~> 1.7"
