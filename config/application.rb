require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SendMailBackGroundJob
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end

  config.action_mailer.delivery_method = :smtp
# SMTP settings for gmail
  config.action_mailer.smtp_settings = {
   :address              => "smtp.gmail.com",
   :port                 => 587,
   :domain               => "localhost:3000",
   :user_name            => ENV['GMAIL_USERNAME'],
   :password             => ENV['GMAIL_PASSWORD'],
   :authentication       => "plain",
   :enable_starttls_auto => true
  }

end
