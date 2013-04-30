source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'jquery-rails'
gem 'rake'
gem 'puma'
gem 'bootstrap-sass'
gem 'simple_form'
gem 'jquery-rails'
gem 'sorcery'
gem 'paperclip'
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
gem 'newrelic_rpm'
gem 'will_paginate'
gem 'rspec-rails' # Necessary in prod & dev

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'factory_girl_rails'
  gem 'cane'
  gem 'reek'
  gem 'debugger'
  gem 'capybara'
  gem 'simplecov'
  gem 'ruby-progressbar'
  gem 'heroku'
  gem 'quiet_assets'
end

group :test do
  gem 'faker'
  gem 'guard-rspec'
  gem 'launchy'
end
