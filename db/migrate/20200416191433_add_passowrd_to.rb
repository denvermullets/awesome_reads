class AddPassowrdTo < ActiveRecord::Migration[6.0]
  def change
    add_column :user_profiles, :password_digest, :string
  end
end
