# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.


if Rails.env.development?
CREDENTIALS = YAML.load_file(Rails.root.join('config','email.yml'))
end


EMAIL = Rails.env.development? ? CREDENTIALS['username'] : ENV['EMAIL']
PASSWORD = Rails.env.development? ? CREDENTIALS['password'] : ENV['PASSWORD']



ActionMailer::Base.smtp_settings = {
  user_name: EMAIL,
  password: PASSWORD,
  address: 'smtp.gmail.com',
  port: 587,
  # domain: 'heroku.com',
  authentication: 'plain',
  enable_starttls_auto: true
   }

FamilyRoom::Application.initialize!
