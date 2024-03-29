class Band < ActiveRecord::Base
	has_many :songs
	has_many :setlists
	has_many :shows
  has_many :members

  acts_as_authentic

  validates_presence_of :name, :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end

# == Schema Information
#
# Table name: bands
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  username          :string(255)
#  crypted_password  :string(255)     not null
#  password_salt     :string(255)     not null
#  persistence_token :string(255)     not null
#  perishable_token  :string(255)     not null
#  admin             :boolean
#  created_at        :datetime
#  updated_at        :datetime
#  email             :string(255)
#

