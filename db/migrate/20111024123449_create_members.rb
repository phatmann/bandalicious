class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references :band
      t.string :name
      t.string :email
      t.string :cell_phone
      t.string :home_phone
      t.string :work_phone
      t.string :instrument

      t.timestamps
    end

    remove_column :bands, :member_emails
  end
end
