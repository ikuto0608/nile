class RenameUserIdToUserLocation < ActiveRecord::Migration[5.0]
  def change
    rename_column :user_locations, :users_id, :user_id
  end
end
