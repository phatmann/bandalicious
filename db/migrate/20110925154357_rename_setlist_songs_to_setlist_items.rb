class RenameSetlistSongsToSetlistItems < ActiveRecord::Migration
  def change
    rename_table :setlist_songs, :setlist_items
  end
end
