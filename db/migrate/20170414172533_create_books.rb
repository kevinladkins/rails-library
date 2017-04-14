class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.integer :author_id
      t.string :title
      t.text :synopsis
      t.integer :status
      t.integer :quantity
      t.timestamps
    end
  end
end
