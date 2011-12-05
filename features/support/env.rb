require 'rubygems'
require 'spork'

Spork.prefork do
  require 'cucumber/rails'
  Capybara.default_selector = :css
  #Capybara.javascript_driver = :webkit
  DatabaseCleaner.strategy = :truncation
  ActionController::Base.allow_rescue = false
end
 
Spork.each_run do
  
end

require 'factory_girl'
require "factory_girl/step_definitions"
Dir.glob(File.join(File.dirname(__FILE__), '../../spec/factories/*.rb')).each {|f| require f }

