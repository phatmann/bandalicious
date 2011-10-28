class Song < ActiveRecord::Base
	belongs_to :band
  acts_as_list :scope => :band
  default_scope :order => 'position'
  validates_presence_of :name
end

# == Schema Information
#
# Table name: songs
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  band_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  position   :integer
#  length     :integer
#

