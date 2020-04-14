class CreateReviewedBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :reviewed_books do |t|
      t.belongs_to :book
      t.belongs_to :review

      t.timestamps
    end
  end
end
