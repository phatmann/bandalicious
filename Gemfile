source 'http://rubygems.org'

gem 'rails', '3.1.0'
gem 'jquery-rails'
gem 'rspec-rails'
gem 'cucumber-rails'
gem 'haml-rails'
gem 'inherited_resources'

gem 'unicorn'
gem 'authlogic'

group :development do
  gem 'sqlite3'
  gem 'ruby-debug19', :require => 'ruby-debug'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end

group :production do
	gem 'therubyracer-heroku', '0.8.1.pre3'
	gem 'pg'
end

group :assets do
  gem 'sass-rails', "~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

# Get version 2.0 (not released yet)
gem 'simple_form', :git => 'git://github.com/plataformatec/simple_form.git'

# Need patch for handling default scope
gem 'acts_as_list', :git => 'git://github.com/swanandp/acts_as_list.git'