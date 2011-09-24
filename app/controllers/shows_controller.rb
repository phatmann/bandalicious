class ShowsController < InheritedResources::Base
	belongs_to :band
  before_filter :require_band
end
