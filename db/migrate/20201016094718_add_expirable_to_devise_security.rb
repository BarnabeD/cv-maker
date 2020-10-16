class AddExpirableToDeviseSecurity < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :password_changed_at, :datetime
    add_index :users, :password_changed_at
  end

  def down
    remove_index :users, :password_changed_at
    remove_index :users, :password_changed_at
  end
end
