class Song < ActiveRecord::Base
  acts_as_list
	belongs_to :band
  default_scope :order => 'position'
end
