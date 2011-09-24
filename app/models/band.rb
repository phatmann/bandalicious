class Band < ActiveRecord::Base
	has_many :songs
	has_many :setlists
	has_many :shows

  acts_as_authentic do |c|
  end
end
