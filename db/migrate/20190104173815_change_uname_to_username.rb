class ChangeUnameToUsername < ActiveRecord::Migration[5.2]
  def change
  	    rename_column :users, :uname, :username
  end
end
