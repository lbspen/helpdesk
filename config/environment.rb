# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Helpdesk::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => "smtp.sendgrid.net",
  # :domain => "example.com",
  :port => "587",
  :user_name => ENV["SENDGRID_USERNAME"],
  :password => ENV["SENDGRID_PASSWORD"],
  :authentication => :plain,
  :enable_starttls_auto => true
}
