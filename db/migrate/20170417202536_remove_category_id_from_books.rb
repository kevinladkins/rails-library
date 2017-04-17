class RemoveCategoryIdFromBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :category_id
  end
end
