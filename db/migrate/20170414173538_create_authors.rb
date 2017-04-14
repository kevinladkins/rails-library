class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.datetime :born
      t.datetime :died
      t.text :bio
    end
  end
end
