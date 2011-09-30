class AddDateFieldToSetlist < ActiveRecord::Migration
  def change
    add_column :setlists, :date, :date
  end
end
