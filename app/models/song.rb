class Song < ActiveRecord::Base
	belongs_to :band
  acts_as_list :scope => :band
  default_scope :order => 'position'
end
