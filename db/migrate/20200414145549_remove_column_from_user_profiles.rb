class RemoveColumnFromUserProfiles < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_profiles, :review_id, :integer
  end
end
