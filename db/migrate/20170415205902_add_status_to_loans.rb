class AddStatusToLoans < ActiveRecord::Migration[5.0]
  def change
    add_column :loans, :status, :integer, default: 0
  end
end
