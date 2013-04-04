# Load the rails application
require File.expand_path('../application', __FILE__)

StoreEngine::Application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address              => 'smtp.gmail.com',
    :port                 => 587,
    :domain               => 'baci.lindsaar.net',
    :user_name            => 'franks.monsterporium@gmail.com',
    :password             => 'bosschops',
    :authentication       => 'plain',
    :enable_starttls_auto => true  }
end

# Initialize the rails application
StoreEngine::Application.initialize!
