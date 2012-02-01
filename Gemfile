source 'http://rubygems.org'

gem 'rails', '3.1.0'
gem 'jquery-rails'
gem 'jquery-ui-themes'
gem 'rspec-rails'
gem 'haml-rails'
gem 'inherited_resources'
gem 'thin'
gem 'authlogic'
gem 'acts_as_list'

group :development do
  gem 'sqlite3'
  gem 'ruby-debug'
  gem 'annotate', :git => 'git://github.com/jeremyolliver/annotate_models.git', :branch => 'rake_compatibility'
end

group :test do
  gem "capybara"
  gem "capybara-webkit"
  gem 'turn', :require => false
  gem 'cucumber-rails'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'minitest'
  gem 'spork'
  gem "selenium-webdriver", "~> 2.17.0"
end

group :production do
	gem 'pg'
end

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

# Get version 2.0 (not released yet)
gem 'simple_form', :git => 'git://github.com/plataformatec/simple_form.git'
