class CreateSetlists < ActiveRecord::Migration
  def change
    create_table :setlists do |t|
    	t.string :name
    	t.references :band
    	t.references :show
      t.timestamps
    end
  end
end
