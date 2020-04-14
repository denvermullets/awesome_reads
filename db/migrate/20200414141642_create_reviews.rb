class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :user_profile_id
      t.integer :book_id
      t.integer :rating
      t.string :title
      t.text :comment

      t.timestamps
    end
  end
end
