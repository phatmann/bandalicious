class Show < ActiveRecord::Base
	belongs_to :band
	belongs_to :setlist
end
