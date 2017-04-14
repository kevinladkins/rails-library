class ChangeStatusBooks < ActiveRecord::Migration[5.0]
  def change
     change_column :books, :status, :integer, default: 0
  end
end
