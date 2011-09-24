class BandsController < InheritedResources::Base
  before_filter :require_no_band, :only => [:new, :create]
  before_filter :require_band, :only => [:show, :edit, :update]
end
