class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
    	t.string :username
    	t.integer :instrument_id
    	t.string :comment
    	t.integer :comment_id

      t.timestamps
    end
  end
end
