source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '>= 5.0.0.beta3', '< 5.1'
gem 'puma'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'turbolinks', '~> 5.x'
gem 'jbuilder', '~> 2.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# use bootstrap style confirmation box
gem 'data-confirm-modal', github: 'ifad/data-confirm-modal'

gem 'feedjira'
gem 'slim'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'pg'
gem 'yt', '~> 0.25.5'
gem 'vimeo', '~> 1.5', '>= 1.5.4'
gem 'annotate'
gem 'devise'
gem 'devise-i18n'
gem 'rails-i18n', '~> 5.0.0.beta1' # For 5.0.0.beta1
gem 'delayed_job_active_record'
gem 'daemons'
gem 'httparty'
gem 'sendgrid'

# use redcarpet for md to html conversion
gem 'redcarpet'
gem 'figaro'
gem 'whenever'

# use administrate for as admin dashboard
#gem "administrate", "> 0.2.0"
gem 'administrate', github: 'hayesr/administrate', branch: 'rails5_compat'

group :development, :test do
  gem 'byebug'
  gem 'mocha'
end

group :development do
  gem 'web-console', '~> 3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :production do
  gem 'capistrano', '~> 3.5'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano3-puma', github: "seuros/capistrano-puma"
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'poltergeist'  # driver for phantomjs/capybara communication
end