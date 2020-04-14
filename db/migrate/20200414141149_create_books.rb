class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.integer :book_genre_id
      t.integer :author_id

      t.string :title
      t.text :description
      t.integer :isbn
      t.string :img_url

      t.timestamps
    end
  end
end
