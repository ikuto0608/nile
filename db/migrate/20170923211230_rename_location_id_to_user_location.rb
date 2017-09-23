class RenameLocationIdToUserLocation < ActiveRecord::Migration[5.0]
  def change
    rename_column :user_locations, :locations_id, :location_id
  end
end
