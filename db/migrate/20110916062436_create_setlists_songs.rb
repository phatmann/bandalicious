class CreateSetlistsSongs < ActiveRecord::Migration
  def change
  	create_table :setlists_songs, :id => false do |t|
  		t.references :setlist
  		t.references :song
  	end

  	add_index(:setlists_songs, [:setlist_id, :song_id], :unique => true)
  end
end
