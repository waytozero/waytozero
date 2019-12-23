require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Waytozero
  class Application < Rails::Application
    config.generators do |generate|
          generate.assets false
          generate.helper false
          generate.test_framework  :test_unit, fixture: false
        end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    ##============================================================##
    ## Config locales
    ## The default locale is :fr and all translations
    ## from config/locales/*.rb,yml are auto loaded.
    ##============================================================##
    config.i18n.default_locale    = :fr
    config.i18n.available_locales = [:fr,:en, :nl]
    config.i18n.fallbacks = {
      :fr  => :en,
      :en  => :fr,
      :nl  => :nl
    }
  end
end
