class DropClassifications < ActiveRecord::Migration[5.0]
  def change
    drop_table :classifcations
  end
end