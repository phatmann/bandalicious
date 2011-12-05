require 'rubygems'
require 'spork'

Spork.prefork do
  require 'cucumber/rails'
  require 'factory_girl'
  require "factory_girl/step_definitions"
  Dir.glob(File.join(File.dirname(__FILE__), '../../spec/factories/*.rb')).each {|f| require f }

  Capybara.default_selector = :css
  #Capybara.javascript_driver = :webkit
end
 
Spork.each_run do
  DatabaseCleaner.strategy = :truncation
  ActionController::Base.allow_rescue = false
end


