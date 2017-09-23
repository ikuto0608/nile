class ChangeColumnsOnUserLocations < ActiveRecord::Migration[5.0]
  def change
    remove_column :user_locations, :user_id
    remove_column :user_locations, :location_id
    add_reference :user_locations, :users, index: true
    add_reference :user_locations, :locations, index: true
  end
end
