class CreateBookGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :book_genres do |t|
      t.belongs_to :genre
      t.belongs_to :book

      t.timestamps
    end
  end
end
