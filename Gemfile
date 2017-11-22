source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.6'
gem 'sqlite3'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jquery-turbolinks'
gem 'jbuilder', '~> 2.5'
gem 'figaro'
gem 'pg'
gem 'devise'
gem 'faker'
gem 'carrierwave', '~> 1.0'
gem 'fog'
gem 'simple_form'
gem 'mini_magick'
gem 'haml'
gem 'bootstrap-sass'
gem 'sass-rails', '~> 5.0'
gem 'rails_admin'
gem 'omniauth'
gem 'omniauth-facebook'
gem "remotipart", "~> 1.0"
gem 'rectify'
gem 'wicked'
gem 'RedCloth'
gem 'pg_search'
gem 'cancancan'
gem 'wisper'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'rails-controller-testing'
  gem 'shoulda-kept-respond-with-content-type'
  gem 'factory_bot_rails'
  gem 'capybara'
  gem 'poltergeist'
  gem 'phantomjs', :require => 'phantomjs/poltergeist'
  
  gem 'capybara-screenshot'
  gem 'database_cleaner'
  gem 'simplecov', require: false
  gem 'wisper-rspec', require: false
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
