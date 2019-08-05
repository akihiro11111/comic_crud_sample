class CreateComics < ActiveRecord::Migration[5.2]
  def change
    create_table :comics do |t|
      t.string :name
      t.integer :price
      t.string :author
      t.timestamps
    end
  end
end
