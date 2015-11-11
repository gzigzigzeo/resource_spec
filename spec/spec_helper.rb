$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "resource_spec"

ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../dummy/config/boot", __FILE__)
require File.expand_path("../dummy/config/environment", __FILE__)

require "rspec/rails"
