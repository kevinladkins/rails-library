class AddClassificationsAndChangeClassificationIdInBooks < ActiveRecord::Migration[5.0]
  def change
    rename_column :books, :classification_id, :category_id
    add_column :books, :classification, :integer
  end
end
