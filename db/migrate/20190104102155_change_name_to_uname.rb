class ChangeNameToUname < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :name, :uname
  end
end
