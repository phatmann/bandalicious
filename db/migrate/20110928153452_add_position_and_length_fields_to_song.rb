class AddPositionAndLengthFieldsToSong < ActiveRecord::Migration
  def change
    add_column :songs, :position, :integer
    add_column :songs, :length, :integer
  end
end
