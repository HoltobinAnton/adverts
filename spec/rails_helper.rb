require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'spec_helper'
require 'rspec/rails'
require 'wisper/rspec/matchers' 
require "rectify/rspec"
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require "cancan/matchers"
require 'support/support_params'
require 'support/wait_for_ajax'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist
require 'support/database_cleaner'
  
abort("The Rails environment is running in production mode!") if Rails.env.production?

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryBot::Syntax::Methods
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
  config.include Rectify::RSpec::Helpers
  config.include(Wisper::RSpec::BroadcastMatcher)
  config.include SupportParams
  config.include WaitForAjax

  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end