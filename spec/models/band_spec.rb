require 'spec_helper'

describe Band do
  pending "add some examples to (or delete) #{__FILE__}"
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

