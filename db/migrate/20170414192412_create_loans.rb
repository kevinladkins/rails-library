class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.integer :patron_id
      t.integer :book_id
      t.datetime :checkout_date
      t.datetime :due_date

      t.timestamps
    end
  end
end
