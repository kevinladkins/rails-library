class AddAlphaTitleToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :alpha_title, :string
  end
end
