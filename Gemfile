source "https://rubygems.org"

ruby "3.3.0"

# --- Rails + Postgres ---
gem "rails", "~> 7.2"
gem "pg", ">= 1.5"
gem "puma", ">= 5.0"
gem "bootsnap", require: false
gem "tzinfo-data", platforms: %i[windows jruby]

# --- FRONTEND ---
# React przez Vite (zamiast importmap). Możesz zostawić turbo/stimulus.
gem "vite_rails"
gem "turbo-rails"
gem "stimulus-rails"
# (opcjonalnie usuń `importmap-rails` jeśli był – z Vite nie jest potrzebny)
# gem "importmap-rails"

# --- WIDOKI ---
gem "haml-rails"

# --- AUTH ---
gem "devise"

# --- MAIL ---
# Action Mailer / Action Mailbox są w Rails (bez dodatkowych gemów).
# Podgląd maili w dev:
group :development do
  gem "letter_opener"
end

# --- KOLEJKI (Delayed Job zamiast Sidekiq) ---
gem "delayed_job_active_record"
gem "delayed_job"

# --- CRON do zadań cyklicznych (np. dzienne podsumowania) ---
gem "whenever", require: false

# --- API/CORS (jeśli łączysz SPA osobno) ---
gem "rack-cors"

# --- NARZĘDZIA/BEZPIECZEŃSTWO (opcjonalnie, polecane) ---
gem "rack-attack"      # rate limiting

# --- JSON helpers (zostaw, jeśli używasz) ---
gem "jbuilder"

group :development, :test do
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "dotenv-rails"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
end

group :development do
  gem "web-console"
  gem "listen"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
