class RemoveBookGenreId < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :book_genre_id, :integer
  end
end
