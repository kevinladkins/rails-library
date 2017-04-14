class AddPublicationYearToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :publication_year, :integer
  end
end
