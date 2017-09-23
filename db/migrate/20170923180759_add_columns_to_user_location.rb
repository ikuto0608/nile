class AddColumnsToUserLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :user_locations, :user_id, :integer
    add_column :user_locations, :location_id, :integer
    add_column :user_locations, :start_time, :datetime
    add_column :user_locations, :end_time, :datetime
  end
end
