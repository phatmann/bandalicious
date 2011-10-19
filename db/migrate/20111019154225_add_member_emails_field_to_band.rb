class AddMemberEmailsFieldToBand < ActiveRecord::Migration
  def change
    add_column :bands, :member_emails, :string
  end
end
