class AddCopiesAndChangeQuantityToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :copies, :integer
    rename_column :books, :quantity, :available_copies
  end
end
