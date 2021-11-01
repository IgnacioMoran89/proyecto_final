require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MarketplaceApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end

  ActionMailer::Base.smtp_settings = {

    :address            => 'smtp.gmail.com',
    :port               => 587,
    :domain             => 'mail.google.com', #you can also use google.com
    :authentication     => 'plain',
    :user_name          => ENV['GMAIL_USERNAME'],
    :password           => ENV['GMAIL_PASSWORD'],
    :authentication => 'login'
    :enable_starttls_auto => true,
     
}
end
