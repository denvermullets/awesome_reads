class CreateUserProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_profiles do |t|
      t.integer :review_id
      t.string :name
      t.text :bio

      t.timestamps
    end
  end
end
