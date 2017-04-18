class RemoveAvaialableCopiesFromBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :available_copies
  end
end
