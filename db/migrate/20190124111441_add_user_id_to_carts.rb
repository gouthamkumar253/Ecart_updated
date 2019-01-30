class AddUserIdToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :user_id, :integer
    add_index :carts, :user_id
  end
end
