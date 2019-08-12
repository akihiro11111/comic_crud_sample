class CreateComics < ActiveRecord::Migration[5.2]
  def change
    create_table :comics do |t|
      t.integer :user_id
      t.string :name
      t.integer :price
      t.string :author
      t.text :story
      t.timestamps
    end
  end
end
