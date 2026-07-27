source "https://rubygems.org"

ruby "3.3.0"

# --- Rails + Postgres ---
gem "rails", "~> 7.2"
gem "pg", ">= 1.5"
gem "puma", ">= 5.0"
gem "bootsnap", require: false
gem "tzinfo-data", platforms: %i[windows jruby]

# --- Frontend / Hotwire ---
gem "sprockets-rails", "~> 3.5"
gem "turbo-rails"
gem "stimulus-rails"
gem "importmap-rails"

# --- Views ---
gem "haml-rails"
gem "sass-rails"

# --- Auth ---
gem "devise"

# --- Background jobs (Delayed Job instead of Sidekiq) ---
gem "delayed_job_active_record"
gem "delayed_job"

# --- Recurring tasks (cron) ---
gem "whenever", require: false

# --- HTTP / API ---
gem "httparty"   # client for the chatmail-analyzer microservice
gem "rack-cors"
gem "jbuilder"

# --- Security ---
gem "rack-attack" # rate limiting

group :development, :test do
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "dotenv-rails"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem "rubocop-rspec", require: false
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
end

group :development do
  gem "web-console"
  gem "listen"
  gem "letter_opener"       # preview outgoing mail in the browser
  gem "pry", "~> 0.15.2"
  gem "html2haml", "~> 2.3" # convert ERB views to Haml
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
