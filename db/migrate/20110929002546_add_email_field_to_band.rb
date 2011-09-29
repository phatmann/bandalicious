class AddEmailFieldToBand < ActiveRecord::Migration
  def change
    add_column :bands, :email, :string
  end
end
