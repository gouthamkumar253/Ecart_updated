class AddStatusToCarts < ActiveRecord::Migration[5.2]
  def change
  	    add_column :carts, :status, :string , :default =>"current"
  end
end
