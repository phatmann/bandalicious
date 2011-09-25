class AddNameToSetlistSong < ActiveRecord::Migration
  def change
    add_column :setlist_songs, :name, :string
  end
end
