ActionMailer::Base.smtp_settings = {
   :address => "smtp.mandrillapp.com",
   :port => 587,
   :user_name => "admin@houzome.com",
   :password => "AvC9ToRfNGbpMFZzKp51Bg",
   :authentication => 'plain'
}

ActionMailer::Base.delivery_method = :smtp

MandrillMailer.configure do |config|
  config.api_key = "AvC9ToRfNGbpMFZzKp51Bg"
end
