source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.1"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.2", ">= 7.0.2.3"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

#registration
gem 'devise'
gem 'devise_token_auth'
gem 'devise-two-factor'
gem 'devise-jwt', '~> 0.10.0'
gem 'rack-cors'
gem 'uuid', '~> 2.3', '>= 2.3.9'
gem 'jwt', '~> 2.3'
gem 'bcrypt', '~> 3.1', '>= 3.1.17'
gem 'passgen', '~> 1.2'
#for async query
gem 'sidekiq', '<7'
gem 'redis', '~> 5.0', '>= 5.0.5'

#sendgrid
gem 'sendgrid-ruby'

#image processing
gem "kt-paperclip", "~> 6.4", ">= 6.4.1"

#admin panel
gem 'activeadmin'
gem 'active_admin-sortable_tree', '~> 2.1'
gem 'active_admin_datetimepicker'
gem 'activeadmin-select2', github: 'mfairburn/activeadmin-select2'
gem 'activeadmin_reorderable'
gem 'activeadmin_medium_editor', '~> 0.2.14'
gem 'activeadmin_addons'
gem 'acts_as_list'
gem 'sass-rails'
gem 'select2-rails'

# Pagination
gem 'kaminari'

# Serializer
gem 'acts_as_api'

# for admin roles
gem 'cancancan'

#for tests
gem 'rspec', '~> 3.12'
gem 'thor', '~> 1.2', '>= 1.2.1'

#debaging
gem 'pry', '~> 0.14.1'

# Code documentation
gem 'swagger-docs'
gem 'swagger_ui_engine', github: 'azelenets/swagger_ui_engine'


gem 'sprockets', '~>3.0'
# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "rack-cors"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'rubocop', require: false
  gem 'rubocop-rspec'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

