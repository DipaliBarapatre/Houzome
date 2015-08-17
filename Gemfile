source "https://rubygems.org"

ruby "2.2.2"

# gem "airbrake"
# gem "autoprefixer-rails"
gem "bourbon", "~> 4.2.0"
gem "coffee-rails", "~> 4.1.0"
gem "delayed_job_active_record"
# gem "email_validator"
# gem "flutie"
gem "high_voltage"
gem "i18n-tasks"
gem "jquery-rails"
gem "neat", "~> 1.7.0"
gem "newrelic_rpm", ">= 3.9.8"
gem "normalize-rails", "~> 3.0.0"
gem "pg"
# gem "rack-canonical-host" ### Look after me 
gem "rails", "4.2.1"
# gem "recipient_interceptor"
gem "refills", github: "thoughtbot/refills"
gem "sass-rails", "~> 5.0"
gem "simple_form"
# gem "title"
gem "uglifier"
gem "unicorn"
gem "font-awesome-rails"
gem "flutie" # automatic titles
gem "selectize-rails"

# gem "refile", require: "refile/rails"
gem 'refile', require: ["refile/rails"], git: 'https://github.com/refile/refile.git', branch: 'master'
gem "refile-mini_magick"
gem 'refile-s3'

group :development do
  # gem "spring"

gem 'quiet_assets'
  # gem "spring-commands-rspec"
  # gem "web-console"
end

group :development, :test do
  gem "awesome_print"
  gem "bundler-audit", require: false
  # gem "byebug"
  gem 'factory_girl_rails'
  gem "dotenv-rails"
  gem "pry-rails"
  # gem 'rspec-rails', '~> 3.0' # Will create specs for controllers automatically while creating
end

group :test do
  # gem "capybara-webkit", ">= 1.2.0"
  # gem "database_cleaner"
  # gem "formulaic"
  # gem "launchy"
  # gem "shoulda-matchers", require: false
  # gem "simplecov", require: false
  # gem "timecop"
  # gem "webmock"
end

group :staging, :production do
  gem "rack-timeout"
end
