source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '3.2.13'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '2.9.0'
  gem 'guard-rspec', '0.5.5'
end

group :test do
  gem 'capybara', '1.1.2'
  gem 'launchy'
  gem 'factory_girl_rails', '4.1.0'
end

group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '3.0.1'