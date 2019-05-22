
ENV["RACK_ENV"] = "test"

require 'bundler'
# require 'webmock/rspec'
Bundler.require(:default, :test)
require File.expand_path('../../config/environment.rb', __FILE__)
require 'capybara/dsl'

Capybara.app = FriendsApp
Capybara.save_path = 'tmp/capybara'

DatabaseCleaner.strategy = :truncation

module RSpecMixin
  include Rack::Test::Methods
  def app() FriendsApp end
end

RSpec.configure do |c|
  c.include Capybara::DSL

  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end

  c.include RSpecMixin
end
