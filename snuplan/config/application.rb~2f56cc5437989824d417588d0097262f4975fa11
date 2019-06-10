require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

#font 접근하려고 추가한건데, 맞는건지 모르겠다.
#config.assets.paths << Rails.root.join('vendor', 'assets', 'fonts')
#config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/



module Snuplan
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
