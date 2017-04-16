class AddClassificationsAndChangeClassificationIdInBooks < ActiveRecord::Migration[5.0]
  def change
    rename_column :books, :category_id, :classification_id
    add_column :books, :classification, :integer
  end
end
