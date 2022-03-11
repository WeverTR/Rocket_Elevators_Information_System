source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.5'

gem 'rails', '~> 5.2.6', '>= 5.2.6.2'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 4.3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

# Bootstrap
gem 'bootstrap', '~> 5.1.3'
# Devise
gem 'devise', '~> 4.8', '>= 4.8.1'
#RailsAdmin
gem 'rails_admin', '~> 2.2', '>= 2.2.1'

gem 'bcrypt'
gem 'font-awesome-sass', '~> 4.3.0'
gem 'bootstrap-social-rails'
gem 'jquery-rails', '~> 4.3', '>= 4.3.3' #newly test
gem 'popper_js', '~> 2.9.3' #new

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano', '~> 3.10', require: false
  gem 'capistrano-rbenv', '~> 2.2'
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'capistrano-bundler', '>= 1.1.0'
  gem 'capistrano3-puma', github: "seuros/capistrano-puma"
  gem 'ed25519', '>= 1.2', '< 2.0'
  gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]