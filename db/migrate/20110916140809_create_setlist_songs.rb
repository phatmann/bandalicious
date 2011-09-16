class CreateSetlistSongs < ActiveRecord::Migration
  def change
    create_table :setlist_songs do |t|
      t.integer :position
      t.references :song
      t.references :setlist

      t.timestamps
    end
    add_index :setlist_songs, :song_id
    add_index :setlist_songs, :setlist_id
  end
end
