#require "authlogic/test_case"

#World(Authlogic::TestCase)

#Before('@activate_authlogic') do
  #ApplicationController.skip_before_filter :activate_authlogic
  #activate_authlogic
#end