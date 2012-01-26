require 'rubygems'
require 'spork'

Spork.prefork do
  require 'cucumber/rails'

  require 'factory_girl'
  require "factory_girl/step_definitions"
  Dir.glob(File.join(File.dirname(__FILE__), '../../spec/factories/*.rb')).each {|f| require f }

  Capybara.default_selector = :css
  Capybara.javascript_driver = :webkit
end
 
Spork.each_run do
	class ActiveRecord::Base
	  mattr_accessor :shared_connection
	  @@shared_connection = nil

	  def self.connection
	    @@shared_connection || retrieve_connection
	  end
	end
	
	ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection

  DatabaseCleaner.strategy = :truncation
  ActionController::Base.allow_rescue = false
end


