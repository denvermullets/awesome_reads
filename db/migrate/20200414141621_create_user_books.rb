class CreateUserBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_books do |t|
      t.belongs_to :book
      t.belongs_to :user_profile

      t.string :status

      t.timestamps
    end
  end
end
