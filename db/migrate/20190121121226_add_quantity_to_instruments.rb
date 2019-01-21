class AddQuantityToInstruments < ActiveRecord::Migration[5.2]
  def change
    add_column :instruments, :quantity, :integer
  end
end
