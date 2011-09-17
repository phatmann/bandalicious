class SongsController < InheritedResources::Base
	belongs_to :band, :optional => true
end
