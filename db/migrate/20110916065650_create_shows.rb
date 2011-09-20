class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.date :date
      t.string :external_id
      t.references :band
      t.timestamps
    end
  end
end
