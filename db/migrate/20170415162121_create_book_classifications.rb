class CreateBookClassifications < ActiveRecord::Migration[5.0]
  def change
    create_table :book_classifications do |t|
      t.integer :book_id
      t.integer :classification_id

      t.timestamps
    end
  end
end
