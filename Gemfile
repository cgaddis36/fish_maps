source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'bootstrap', '~> 4.5.0'
gem 'figaro'
gem 'jbuilder', '~> 2.7'
gem 'jquery-rails'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'pry'
gem 'puma', '~> 4.3'
gem 'rails', '~> 6.0.0'
gem 'rubocop-rails', require: false
gem 'sass-rails', '~> 5'
gem 'webpacker', '~> 4.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
