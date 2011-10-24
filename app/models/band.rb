class Band < ActiveRecord::Base
	has_many :songs
	has_many :setlists
	has_many :shows
  has_many :members

  acts_as_authentic

  validates_presence_of :name, :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
