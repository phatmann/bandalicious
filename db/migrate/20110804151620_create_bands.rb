class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string  :name
      t.string  :username
      t.string  :crypted_password,    :null => false
      t.string  :password_salt,       :null => false
      t.string  :persistence_token,   :null => false
      t.string  :perishable_token,    :null => false

      t.timestamps
    end
  end
end
