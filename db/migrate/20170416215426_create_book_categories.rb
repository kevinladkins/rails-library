class CreateBookCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :book_categories do |t|
      t.integer :category_id
      t.integer :book_id
    end
  end
end
