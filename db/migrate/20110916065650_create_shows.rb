class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.date :date
      t.references :band
      t.references :setlist
      t.timestamps
    end
  end
end
