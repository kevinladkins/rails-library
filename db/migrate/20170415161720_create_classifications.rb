class CreateClassifications < ActiveRecord::Migration[5.0]
  def change
    create_table :classifications do |t|
      t.integer :category
      t.string :type
      t.string :subtype

      t.timestamps
    end
  end
end
