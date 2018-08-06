require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # config.generators do |g|
    #   g.test_framework      :minitest, fixture_replacement: :FactoryBot
    #   g.fixture_replacement :FactoryBot, dir: "test/factories"
    # end
    # config.generators do |g|
    #   g.test_framework      :minitest, fixture_replacement: :fabrication
    #   g.fixture_replacement :fabrication, dir: "test/fabricators"
    # end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
