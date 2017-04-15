class CreateAuthorClassifications < ActiveRecord::Migration[5.0]
  def change
    create_table :author_classifications do |t|
      t.integer :author_id
      t.integer :classification_id

      t.timestamps
    end
  end
end
