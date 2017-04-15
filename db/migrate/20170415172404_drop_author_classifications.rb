class DropAuthorClassifications < ActiveRecord::Migration[5.0]
  def change
    drop_table :author_classifications
  end
end
