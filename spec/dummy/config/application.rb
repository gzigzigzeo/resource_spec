require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "active_record/railtie"
require "responders"

Bundler.require(*Rails.groups)

module Dummy
  class Application < Rails::Application
  end
end
