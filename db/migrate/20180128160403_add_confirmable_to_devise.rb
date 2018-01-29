class AddConfirmableToDevise < ActiveRecord::Migration[5.1]
#   # Note: You can't use change, as User.update_all will fail in the down migration
  def up
  	add_column :usuarios, :confirmation_token, :string
    add_column :usuarios, :confirmed_at, :datetime
    add_column :usuarios, :confirmation_sent_at, :datetime
    add_index :usuarios, :confirmation_token, unique: true
  end

  def down
    # remove_columns :usuarios, :confirmation_token, :confirmed_at, :confirmation_sent_at
    # remove_columns :usuarios, :unconfirmed_email # Only if using reconfirmable
  end
end