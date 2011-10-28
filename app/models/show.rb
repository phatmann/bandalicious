class Show < ActiveRecord::Base
	belongs_to :band
  validates_presence_of :name
end

# == Schema Information
#
# Table name: shows
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  date        :date
#  external_id :string(255)
#  band_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

