class Member < ActiveRecord::Base
  belongs_to :band
end

# == Schema Information
#
# Table name: members
#
#  id         :integer         not null, primary key
#  band_id    :integer
#  name       :string(255)
#  email      :string(255)
#  cell_phone :string(255)
#  home_phone :string(255)
#  work_phone :string(255)
#  instrument :string(255)
#  created_at :datetime
#  updated_at :datetime
#

