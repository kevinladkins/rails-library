class RemoveColumnStatusFromBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :status
  end
end
