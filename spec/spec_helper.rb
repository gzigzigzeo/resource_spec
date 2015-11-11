$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "resource_spec"

ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../dummy/config/boot", __FILE__)
require File.expand_path("../dummy/config/environment", __FILE__)
require File.expand_path("../dummy/db/schema.rb", __FILE__)

require "rspec/rails"
require "factory_girl"
require "ffaker"
require "database_cleaner"
require "resource_spec/all"

FactoryGirl.reload

RSpec.configure do |config|
  config.around(:each) do |example|
    DatabaseCleaner.strategy = example.metadata[:clean_with] || :transaction
    DatabaseCleaner.cleaning { example.run }
  end
end
