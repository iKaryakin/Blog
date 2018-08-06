ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'capybara/rails'
require 'capybara/minitest'
require 'rack/test'
# require 'capybara/rspec'

# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :chrome)
#  end

# class Minitest::Spec
#   include FactoryBot::Syntax::Methods
# end
# class Test::Unit::TestCase
#   include FactoryBot::Syntax::Methods
# end

# class ActiveSupport::TestCase
#   include FactoryBot::Syntax::Methods
# end
# class Minitest::Unit::TestCase
#   include FactoryBot::Syntax::Methods
# end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # config.include Capybara::DSL
  include Capybara::DSL
  include Capybara::Minitest::Assertions
  include FactoryBot::Syntax::Methods


  # def teardown
  #   Capybara.reset_sessions!
  #   Capybara.use_default_driver
  # end

  # Add more helper methods to be used by all tests here...
end
