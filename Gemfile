source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1'
# Use sqlite3 as the database for Active Record

group :development, :test do
	gem 'pry'
  # gem 'pg', '~> 0.18'
	gem 'sqlite3', '~> 1.3.0'
end

group :production, :test do
	gem 'pg', '~> 0.18'
end
# Sidekiq schtuff
gem 'sidekiq', '~> 3.3.4'
gem 'sidekiq-limit_fetch'


#group :production do
  #gem 'sqlite3', '~> 1.3.0'
#end
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
gem 'jwt_sessions', '~> 2.3'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


gem 'hashie'
gem 'devise', '~> 4.3.0'
gem 'omniauth-google-oauth2', '~> 0.2.2'
gem 'acts_as_tenant'
gem 'webpacker'
