class RenameTypeColumnsClassifications < ActiveRecord::Migration[5.0]
  def change
    rename_column :classifications, :type, :main_type
  end
end
